//===---------- usm_allocator.cpp - Allocator for USM memory --------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include <algorithm>
#include <array>
#include <bitset>
#include <cassert>
#include <iostream>
#include <list>
#include <memory>
#include <mutex>
#include <shared_mutex>
#include <unordered_map>
#include <utility>
#include <vector>

#include "usm_allocator.hpp"

namespace settings {
// Size of the slab which is going to be requested from the system.
static constexpr size_t SlabSize = 64 * 1024; // 64K
// The largest size which is allocated via the allocator.
// Allocations with size > CutOff bypass the USM allocator and
// go directly to the runtime.
static constexpr size_t CutOff = SlabSize / 2;

// Unfortunately we cannot deduce the size of the array, so every change
// to the number of buckets should be reflected here.
using BucketsArrayType = std::array<size_t, 21>;

// Generates a list of bucket sizes used by the allocator.
static constexpr BucketsArrayType generateBucketSizes() {

// In order to make bucket sizes constexpr simply write
// them all. There are some restrictions that doesn't
// allow to write this in a nicer way.

// Simple helper to compute power of 2
#define P(n) (1 << n)

  BucketsArrayType Sizes = {32,    48,
                            64,    96,
                            128,   192,
                            P(8),  P(8) + P(7),
                            P(9),  P(9) + P(8),
                            P(10), P(10) + P(9),
                            P(11), P(11) + P(10),
                            P(12), P(12) + P(11),
                            P(13), P(13) + P(12),
                            P(14), P(14) + P(13),
                            CutOff};
#undef P

  return Sizes;
}

static constexpr BucketsArrayType BucketSizes = generateBucketSizes();

// The implementation expects that SlabSize is 2^n
static_assert((SlabSize & (SlabSize - 1)) == 0,
              "SlabSize must be a power of 2");
} // namespace settings

// Aligns the pointer down to the specified alignment
// (e.g. returns 8 for Size = 13, Alignment = 8)
static void *AlignPtrDown(void *Ptr, const size_t Alignment) {
  return reinterpret_cast<void *>((reinterpret_cast<size_t>(Ptr)) &
                                  (~(Alignment - 1)));
}

// Aligns the pointer up to the specified alignment
// (e.g. returns 16 for Size = 13, Alignment = 8)
static void *AlignPtrUp(void *Ptr, const size_t Alignment) {
  void *AlignedPtr = AlignPtrDown(Ptr, Alignment);
  // Special case when the pointer is already aligned
  if (Ptr == AlignedPtr) {
    return Ptr;
  }
  return static_cast<char *>(AlignedPtr) + Alignment;
}

// Aligns the value up to the specified alignment
// (e.g. returns 16 for Size = 13, Alignment = 8)
static size_t AlignUp(size_t Val, size_t Alignment) {
  assert(Alignment > 0);
  return (Val + Alignment - 1) & (~(Alignment - 1));
}

class Bucket;

// Represents the allocated memory block of size 'settings::SlabSize'
// Internally, it splits the memory block into chunks. The number of
// chunks depends of the size of a Bucket which created the Slab.
// The chunks
// Note: Bucket's method are responsible for thread safety of Slab access,
// so no locking happens here.
class Slab {

  // Pointer to the allocated memory of SlabSize bytes
  void *MemPtr;

  // Represents the current state of each chunk:
  // if the bit is set then the chunk is allocated
  // the chunk is free for allocation otherwise
  std::vector<bool> Chunks;

  // Total number of allocated chunks at the moment.
  size_t NumAllocated = 0;

  // The bucket which the slab belongs to
  Bucket &bucket;

  using ListIter = std::list<std::unique_ptr<Slab>>::iterator;

  // Store iterator to the corresponding node in avail/unavail list
  // to achieve O(1) removal
  ListIter SlabListIter;

  // Hints where to start search for free chunk in a slab
  size_t FirstFreeChunkIdx = 0;

  // Return the index of the first available chunk, -1 otherwize
  size_t FindFirstAvailableChunkIdx() const;

  // Register/Unregister the slab in the global slab address map.
  static void regSlab(Slab &);
  static void unregSlab(Slab &);
  static void regSlabByAddr(void *, Slab &);
  static void unregSlabByAddr(void *, Slab &);

public:
  Slab(Bucket &);
  ~Slab();

  void setIterator(ListIter It) { SlabListIter = It; }
  ListIter getIterator() const { return SlabListIter; }

  size_t getNumAllocated() const { return NumAllocated; }

  void *getFreeChunk();

  void *getPtr() const { return MemPtr; }
  void *getEnd() const {
    return static_cast<char *>(getPtr()) + settings::SlabSize;
  }

  size_t getChunkSize() const;
  size_t getNumChunks() const { return Chunks.size(); }

  bool hasAvail();

  Bucket &getBucket();
  const Bucket &getBucket() const;

  void freeChunk(void *Ptr);
};

class Bucket {
  const size_t Size;

  // List of slabs which have at least 1 available chunk.
  std::list<std::unique_ptr<Slab>> AvailableSlabs;

  // List of slabs with 0 available chunk.
  std::list<std::unique_ptr<Slab>> UnavailableSlabs;

  // Protects the bucket and all the corresponding slabs
  std::mutex BucketLock;

  // Reference to the allocator context, used access memory allocation
  // routines, slab map and etc.
  USMAllocContext::USMAllocImpl &OwnAllocCtx;

public:
  Bucket(size_t Sz, USMAllocContext::USMAllocImpl &AllocCtx)
      : Size{Sz}, OwnAllocCtx{AllocCtx} {}

  void *getChunk();

  size_t getSize() const { return Size; }

  void freeChunk(void *Ptr, Slab &Slab);
  SystemMemory &getMemHandle();
  USMAllocContext::USMAllocImpl &getUsmAllocCtx() { return OwnAllocCtx; }

private:
  void onFreeChunk(Slab &);
  decltype(AvailableSlabs.begin()) getAvailSlab();
};

class USMAllocContext::USMAllocImpl {
  // It's important for the map to be destroyed last after buckets and their
  // slabs This is because slab's destructor removes the object from the map.
  std::unordered_multimap<void *, Slab &> KnownSlabs;
  std::shared_timed_mutex KnownSlabsMapLock;

  // Handle to the memory allocation routine
  std::unique_ptr<SystemMemory> MemHandle;

  // Store as unique_ptrs since Bucket is not Movable(because of std::mutex)
  std::vector<std::unique_ptr<Bucket>> Buckets;

public:
  USMAllocImpl(std::unique_ptr<SystemMemory> SystemMemHandle)
      : MemHandle{std::move(SystemMemHandle)} {

    Buckets.reserve(settings::BucketSizes.size());

    for (auto &&Size : settings::BucketSizes) {
      Buckets.emplace_back(std::make_unique<Bucket>(Size, *this));
    }
  }

  void *allocate(size_t Size, size_t Alignment);
  void *allocate(size_t Size);
  void deallocate(void *Ptr);

  SystemMemory &getMemHandle() { return *MemHandle; }

  std::shared_timed_mutex &getKnownSlabsMapLock() { return KnownSlabsMapLock; }
  std::unordered_multimap<void *, Slab &> &getKnownSlabs() {
    return KnownSlabs;
  }

private:
  Bucket &findBucket(size_t Size);
};

bool operator==(const Slab &Lhs, const Slab &Rhs) {
  return Lhs.getPtr() == Rhs.getPtr();
}

std::ostream &operator<<(std::ostream &Os, const Slab &Slab) {
  Os << "Slab<" << Slab.getPtr() << ", " << Slab.getEnd() << ", "
     << Slab.getBucket().getSize() << ">";
  return Os;
}

Slab::Slab(Bucket &Bkt)
    : MemPtr(Bkt.getMemHandle().allocate(settings::SlabSize)),
      // In case if bucket size is not that SlabSize % b.getSize() == 0, we
      // would have some padding at the end of the slab.
      Chunks(settings::SlabSize / Bkt.getSize()), NumAllocated{0},
      bucket(Bkt), SlabListIter{}, FirstFreeChunkIdx{0} {

  regSlab(*this);
}

Slab::~Slab() {
  unregSlab(*this);
  bucket.getMemHandle().deallocate(MemPtr);
}

// Return the index of the first available chunk, -1 otherwize
size_t Slab::FindFirstAvailableChunkIdx() const {
  // Use the first free chunk index as a hint for the search.
  auto It = std::find_if(Chunks.begin() + FirstFreeChunkIdx, Chunks.end(),
                         [](auto x) { return !x; });
  if (It != Chunks.end()) {
    return It - Chunks.begin();
  }

  return static_cast<size_t>(-1);
}

void *Slab::getFreeChunk() {
  assert(NumAllocated != Chunks.size());

  const size_t ChunkIdx = FindFirstAvailableChunkIdx();
  // Free chunk must exist, otherwise we would have allocated another slab
  assert(ChunkIdx != (static_cast<size_t>(-1)));

  void *const FreeChunk =
      (static_cast<uint8_t *>(getPtr())) + ChunkIdx * getChunkSize();
  Chunks[ChunkIdx] = true;
  NumAllocated += 1;

  // Use the found index as the next hint
  FirstFreeChunkIdx = ChunkIdx;

  return FreeChunk;
}

Bucket &Slab::getBucket() { return bucket; }
const Bucket &Slab::getBucket() const { return bucket; }

size_t Slab::getChunkSize() const { return bucket.getSize(); }

void Slab::regSlabByAddr(void *Addr, Slab &Slab) {
  auto &Lock = Slab.getBucket().getUsmAllocCtx().getKnownSlabsMapLock();
  auto &Map = Slab.getBucket().getUsmAllocCtx().getKnownSlabs();

  std::lock_guard<std::shared_timed_mutex> Lg(Lock);
  Map.insert({Addr, Slab});
}

void Slab::unregSlabByAddr(void *Addr, Slab &Slab) {
  auto &Lock = Slab.getBucket().getUsmAllocCtx().getKnownSlabsMapLock();
  auto &Map = Slab.getBucket().getUsmAllocCtx().getKnownSlabs();

  std::lock_guard<std::shared_timed_mutex> Lg(Lock);

  auto Slabs = Map.equal_range(Addr);
  // At least the must get the current slab from the map.
  assert(Slabs.first != Slabs.second && "Slab is not found");

  for (auto It = Slabs.first; It != Slabs.second; ++It) {
    if (It->second == Slab) {
      Map.erase(It);
      return;
    }
  }

  assert(false && "Slab is not found");
}

void Slab::regSlab(Slab &Slab) {
  void *StartAddr = AlignPtrDown(Slab.getPtr(), settings::SlabSize);
  void *EndAddr = static_cast<char *>(StartAddr) + settings::SlabSize;

  regSlabByAddr(StartAddr, Slab);
  regSlabByAddr(EndAddr, Slab);
}

void Slab::unregSlab(Slab &Slab) {
  void *StartAddr = AlignPtrDown(Slab.getPtr(), settings::SlabSize);
  void *EndAddr = static_cast<char *>(StartAddr) + settings::SlabSize;

  unregSlabByAddr(StartAddr, Slab);
  unregSlabByAddr(EndAddr, Slab);
}

void Slab::freeChunk(void *Ptr) {
  // This method should be called through bucket(since we might remove the slab
  // as a result), therefore all locks are done on that level.

  // Make sure that we're in the right slab
  assert(Ptr >= getPtr() && Ptr < getEnd());

  // Even if the pointer p was previously aligned, it's still inside the
  // corresponding chunk, so we get the correct index here.
  auto ChunkIdx =
      (static_cast<char *>(Ptr) - static_cast<char *>(MemPtr)) / getChunkSize();

  // Make sure that the chunk was allocated
  assert(Chunks[ChunkIdx] && "double free detected");

  Chunks[ChunkIdx] = false;
  NumAllocated -= 1;

  if (ChunkIdx < FirstFreeChunkIdx)
    FirstFreeChunkIdx = ChunkIdx;
}

bool Slab::hasAvail() { return NumAllocated != getNumChunks(); }

auto Bucket::getAvailSlab() -> decltype(AvailableSlabs.begin()) {
  if (AvailableSlabs.size() == 0) {
    auto It = AvailableSlabs.insert(AvailableSlabs.begin(),
                                    std::make_unique<Slab>(*this));
    (*It)->setIterator(It);
  }

  return AvailableSlabs.begin();
}

void *Bucket::getChunk() {
  std::lock_guard<std::mutex> Lg(BucketLock);

  auto SlabIt = getAvailSlab();
  auto *FreeChunk = (*SlabIt)->getFreeChunk();

  // If the slab is full, move it to unavailable slabs and update its itreator
  if (!((*SlabIt)->hasAvail())) {
    auto It =
        UnavailableSlabs.insert(UnavailableSlabs.begin(), std::move(*SlabIt));
    AvailableSlabs.erase(SlabIt);
    (*It)->setIterator(It);
  }

  return FreeChunk;
}

void Bucket::freeChunk(void *Ptr, Slab &Slab) {
  std::lock_guard<std::mutex> Lg(BucketLock);

  Slab.freeChunk(Ptr);

  onFreeChunk(Slab);
}

// The lock must be acquired before calling this method
void Bucket::onFreeChunk(Slab &Slab) {
  // In case if the slab was previously full and now has 1 available
  // chunk, it should be moved to the list of available slabs
  if (Slab.getNumAllocated() == (Slab.getNumChunks() - 1)) {
    auto SlabIter = Slab.getIterator();
    assert(SlabIter != UnavailableSlabs.end());

    auto It =
        AvailableSlabs.insert(AvailableSlabs.begin(), std::move(*SlabIter));
    UnavailableSlabs.erase(SlabIter);

    (*It)->setIterator(It);
  }

  // Remove the slab when all the chunks from it are deallocated
  // Note: since the slab is stored as unique_ptr, just remove it from
  // the list to remove the list to destroy the object
  if (Slab.getNumAllocated() == 0) {
    auto It = Slab.getIterator();
    assert(It != AvailableSlabs.end());

    AvailableSlabs.erase(It);
  }
}

SystemMemory &Bucket::getMemHandle() { return OwnAllocCtx.getMemHandle(); }

void *USMAllocContext::USMAllocImpl::allocate(size_t Size) {
  if (Size == 0)
    return nullptr;

  if (Size > settings::CutOff)
    return getMemHandle().allocate(Size);

  return findBucket(Size).getChunk();
}

void *USMAllocContext::USMAllocImpl::allocate(size_t Size, size_t Alignment) {
  if (Size == 0)
    return nullptr;

  if (Alignment <= 1)
    return allocate(Size);

  size_t AlignedSize = (Size > 1) ? AlignUp(Size, Alignment) : Alignment;

  // Check if our largest chunk is able to fit aligned size.
  // If not, just request aligned pointer from the system.
  if (AlignedSize > settings::CutOff) {
    return getMemHandle().allocate(Size, Alignment);
  }

  auto *Ptr = findBucket(AlignedSize).getChunk();
  return AlignPtrUp(Ptr, Alignment);
}

Bucket &USMAllocContext::USMAllocImpl::findBucket(size_t Size) {
  assert(Size <= settings::CutOff && "Unexpected size");

  auto It = std::find_if(
      Buckets.begin(), Buckets.end(),
      [Size](const auto &BucketPtr) { return BucketPtr->getSize() >= Size; });

  assert((It != Buckets.end()) && "Bucket should always exist");

  return *(*It);
}

void USMAllocContext::USMAllocImpl::deallocate(void *Ptr) {
  auto *SlabPtr = AlignPtrDown(Ptr, settings::SlabSize);

  // Lock the map on read
  std::shared_lock<std::shared_timed_mutex> Lk(getKnownSlabsMapLock());

  auto Slabs = getKnownSlabs().equal_range(SlabPtr);
  if (Slabs.first == Slabs.second) {
    Lk.unlock();
    getMemHandle().deallocate(Ptr);
    return;
  }

  for (auto It = Slabs.first; It != Slabs.second; ++It) {
    // The slab object won't be deleted until it's removed from the map which is
    // protected by the lock, so it's safe to access it here.
    auto &Slab = It->second;
    if (Ptr >= Slab.getPtr() && Ptr < Slab.getEnd()) {

      // Unlock the map before freeing the chunk, it may be locked on write
      // there
      Lk.unlock();
      auto &Bucket = Slab.getBucket();
      Bucket.freeChunk(Ptr, Slab);
      return;
    }
  }

  Lk.unlock();
  // There is a rare case when we have a pointer from system allocation next
  // to some slab with an entry in the map. So we find a slab
  // but the range checks fail.
  getMemHandle().deallocate(Ptr);
}

USMAllocContext::USMAllocContext(std::unique_ptr<SystemMemory> MemHandle)
    : pImpl(std::make_unique<USMAllocImpl>(std::move(MemHandle))) {}

void *USMAllocContext::allocate(size_t size) { return pImpl->allocate(size); }

void *USMAllocContext::allocate(size_t size, size_t alignment) {
  return pImpl->allocate(size, alignment);
}

void USMAllocContext::deallocate(void *ptr) { return pImpl->deallocate(ptr); }

// Define destructor for its usage with unique_ptr
USMAllocContext::~USMAllocContext() = default;

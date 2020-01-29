; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -mtriple=thumbv8.1m.main -mve-tail-predication -disable-mve-tail-predication=false -mattr=+mve %s -S -o - | FileCheck %s

define dso_local void @foo(i32* noalias nocapture %A, i32* noalias nocapture readonly %B, i32* noalias nocapture readonly %C, i32* noalias nocapture readnone %D, i32 %N) local_unnamed_addr #0 {
; CHECK-LABEL: @foo(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    call void @llvm.set.loop.iterations.i32(i32 8001)
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[LSR_IV14:%.*]] = phi i32* [ [[SCEVGEP15:%.*]], [[VECTOR_BODY]] ], [ [[A:%.*]], [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[LSR_IV11:%.*]] = phi i32* [ [[SCEVGEP12:%.*]], [[VECTOR_BODY]] ], [ [[C:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32* [ [[SCEVGEP:%.*]], [[VECTOR_BODY]] ], [ [[B:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = phi i32 [ 8001, [[ENTRY]] ], [ [[TMP5:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP1:%.*]] = phi i32 [ 32002, [[ENTRY]] ], [ [[TMP3:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[LSR_IV1416:%.*]] = bitcast i32* [[LSR_IV14]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV1113:%.*]] = bitcast i32* [[LSR_IV11]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV10:%.*]] = bitcast i32* [[LSR_IV]] to <4 x i32>*
; CHECK-NEXT:    [[TMP2:%.*]] = call <4 x i1> @llvm.arm.mve.vctp32(i32 [[TMP1]])
; CHECK-NEXT:    [[TMP3]] = sub i32 [[TMP1]], 4
; CHECK-NEXT:    [[WIDE_MASKED_LOAD:%.*]] = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* [[LSR_IV10]], i32 4, <4 x i1> [[TMP2]], <4 x i32> undef)
; CHECK-NEXT:    [[WIDE_MASKED_LOAD9:%.*]] = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* [[LSR_IV1113]], i32 4, <4 x i1> [[TMP2]], <4 x i32> undef)
; CHECK-NEXT:    [[TMP4:%.*]] = add nsw <4 x i32> [[WIDE_MASKED_LOAD9]], [[WIDE_MASKED_LOAD]]
; CHECK-NEXT:    call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> [[TMP4]], <4 x i32>* [[LSR_IV1416]], i32 4, <4 x i1> [[TMP2]])
; CHECK-NEXT:    [[SCEVGEP]] = getelementptr i32, i32* [[LSR_IV]], i32 4
; CHECK-NEXT:    [[SCEVGEP12]] = getelementptr i32, i32* [[LSR_IV11]], i32 4
; CHECK-NEXT:    [[SCEVGEP15]] = getelementptr i32, i32* [[LSR_IV14]], i32 4
; CHECK-NEXT:    [[TMP5]] = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 [[TMP0]], i32 1)
; CHECK-NEXT:    [[TMP6:%.*]] = icmp ne i32 [[TMP5]], 0
; CHECK-NEXT:    br i1 [[TMP6]], label [[VECTOR_BODY]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  call void @llvm.set.loop.iterations.i32(i32 8001)
  br label %vector.body

vector.body:
  %lsr.iv14 = phi i32* [ %scevgep15, %vector.body ], [ %A, %entry ]
  %lsr.iv11 = phi i32* [ %scevgep12, %vector.body ], [ %C, %entry ]
  %lsr.iv = phi i32* [ %scevgep, %vector.body ], [ %B, %entry ]
  %index = phi i32 [ 0, %entry ], [ %index.next, %vector.body ]
  %0 = phi i32 [ 8001, %entry ], [ %3, %vector.body ]
  %lsr.iv1416 = bitcast i32* %lsr.iv14 to <4 x i32>*
  %lsr.iv1113 = bitcast i32* %lsr.iv11 to <4 x i32>*
  %lsr.iv10 = bitcast i32* %lsr.iv to <4 x i32>*
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %index, i32 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i32> %broadcast.splat, <i32 0, i32 1, i32 2, i32 3>
  %1 = icmp ult <4 x i32> %induction, <i32 32002, i32 32002, i32 32002, i32 32002>
  %wide.masked.load = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %lsr.iv10, i32 4, <4 x i1> %1, <4 x i32> undef)
  %wide.masked.load9 = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %lsr.iv1113, i32 4, <4 x i1> %1, <4 x i32> undef)
  %2 = add nsw <4 x i32> %wide.masked.load9, %wide.masked.load
  call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> %2, <4 x i32>* %lsr.iv1416, i32 4, <4 x i1> %1)
  %index.next = add i32 %index, 4
  %scevgep = getelementptr i32, i32* %lsr.iv, i32 4
  %scevgep12 = getelementptr i32, i32* %lsr.iv11, i32 4
  %scevgep15 = getelementptr i32, i32* %lsr.iv14, i32 4
  %3 = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 %0, i32 1)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %vector.body, label %for.cond.cleanup

for.cond.cleanup:
  ret void
}

; Silly test case: the loop count is constant and a multiple of the vectorisation
; factor. So, the vectoriser should not produce masked loads/stores and there's
; nothing to tail-predicate here, just checking.
define dso_local void @foo2(i32* noalias nocapture %A, i32* noalias nocapture readonly %B, i32* noalias nocapture readonly %C, i32* noalias nocapture readnone %D, i32 %N) local_unnamed_addr #0 {
; CHECK-LABEL: @foo2(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    call void @llvm.set.loop.iterations.i32(i32 2000)
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[LSR_IV14:%.*]] = phi i32* [ [[SCEVGEP15:%.*]], [[VECTOR_BODY]] ], [ [[A:%.*]], [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[LSR_IV11:%.*]] = phi i32* [ [[SCEVGEP12:%.*]], [[VECTOR_BODY]] ], [ [[C:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32* [ [[SCEVGEP:%.*]], [[VECTOR_BODY]] ], [ [[B:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = phi i32 [ 2000, [[ENTRY]] ], [ [[TMP2:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[LSR_IV1416:%.*]] = bitcast i32* [[LSR_IV14]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV1113:%.*]] = bitcast i32* [[LSR_IV11]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV10:%.*]] = bitcast i32* [[LSR_IV]] to <4 x i32>*
; CHECK-NEXT:    [[WIDE_LOAD:%.*]] = load <4 x i32>, <4 x i32>* [[LSR_IV10]], align 4
; CHECK-NEXT:    [[WIDE_LOAD9:%.*]] = load <4 x i32>, <4 x i32>* [[LSR_IV1113]], align 4
; CHECK-NEXT:    [[TMP1:%.*]] = add nsw <4 x i32> [[WIDE_LOAD9]], [[WIDE_LOAD]]
; CHECK-NEXT:    store <4 x i32> [[TMP1]], <4 x i32>* [[LSR_IV1416]], align 4
; CHECK-NEXT:    [[SCEVGEP]] = getelementptr i32, i32* [[LSR_IV]], i32 4
; CHECK-NEXT:    [[SCEVGEP12]] = getelementptr i32, i32* [[LSR_IV11]], i32 4
; CHECK-NEXT:    [[SCEVGEP15]] = getelementptr i32, i32* [[LSR_IV14]], i32 4
; CHECK-NEXT:    [[TMP2]] = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 [[TMP0]], i32 1)
; CHECK-NEXT:    [[TMP3:%.*]] = icmp ne i32 [[TMP2]], 0
; CHECK-NEXT:    br i1 [[TMP3]], label [[VECTOR_BODY]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  call void @llvm.set.loop.iterations.i32(i32 2000)
  br label %vector.body

vector.body:
  %lsr.iv14 = phi i32* [ %scevgep15, %vector.body ], [ %A, %entry ]
  %lsr.iv11 = phi i32* [ %scevgep12, %vector.body ], [ %C, %entry ]
  %lsr.iv = phi i32* [ %scevgep, %vector.body ], [ %B, %entry ]
  %0 = phi i32 [ 2000, %entry ], [ %2, %vector.body ]
  %lsr.iv1416 = bitcast i32* %lsr.iv14 to <4 x i32>*
  %lsr.iv1113 = bitcast i32* %lsr.iv11 to <4 x i32>*
  %lsr.iv10 = bitcast i32* %lsr.iv to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %lsr.iv10, align 4
  %wide.load9 = load <4 x i32>, <4 x i32>* %lsr.iv1113, align 4
  %1 = add nsw <4 x i32> %wide.load9, %wide.load
  store <4 x i32> %1, <4 x i32>* %lsr.iv1416, align 4
  %scevgep = getelementptr i32, i32* %lsr.iv, i32 4
  %scevgep12 = getelementptr i32, i32* %lsr.iv11, i32 4
  %scevgep15 = getelementptr i32, i32* %lsr.iv14, i32 4
  %2 = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 %0, i32 1)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %vector.body, label %for.cond.cleanup

for.cond.cleanup:
  ret void
}

; Check that the icmp is a ult
define dso_local void @foo3(i32* noalias nocapture %A, i32* noalias nocapture readonly %B, i32* noalias nocapture readonly %C, i32* noalias nocapture readnone %D, i32 %N) local_unnamed_addr #0 {
; CHECK-LABEL: @foo3(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    call void @llvm.set.loop.iterations.i32(i32 8001)
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[LSR_IV14:%.*]] = phi i32* [ [[SCEVGEP15:%.*]], [[VECTOR_BODY]] ], [ [[A:%.*]], [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[LSR_IV11:%.*]] = phi i32* [ [[SCEVGEP12:%.*]], [[VECTOR_BODY]] ], [ [[C:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32* [ [[SCEVGEP:%.*]], [[VECTOR_BODY]] ], [ [[B:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[INDEX:%.*]] = phi i32 [ 0, [[ENTRY]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = phi i32 [ 8001, [[ENTRY]] ], [ [[TMP3:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[LSR_IV1416:%.*]] = bitcast i32* [[LSR_IV14]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV1113:%.*]] = bitcast i32* [[LSR_IV11]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV10:%.*]] = bitcast i32* [[LSR_IV]] to <4 x i32>*
; CHECK-NEXT:    [[BROADCAST_SPLATINSERT:%.*]] = insertelement <4 x i32> undef, i32 [[INDEX]], i32 0
; CHECK-NEXT:    [[BROADCAST_SPLAT:%.*]] = shufflevector <4 x i32> [[BROADCAST_SPLATINSERT]], <4 x i32> undef, <4 x i32> zeroinitializer
; CHECK-NEXT:    [[INDUCTION:%.*]] = add <4 x i32> [[BROADCAST_SPLAT]], <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    [[TMP1:%.*]] = icmp ugt <4 x i32> [[INDUCTION]], <i32 32002, i32 32002, i32 32002, i32 32002>
; CHECK-NEXT:    [[WIDE_MASKED_LOAD:%.*]] = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* [[LSR_IV10]], i32 4, <4 x i1> [[TMP1]], <4 x i32> undef)
; CHECK-NEXT:    [[WIDE_MASKED_LOAD9:%.*]] = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* [[LSR_IV1113]], i32 4, <4 x i1> [[TMP1]], <4 x i32> undef)
; CHECK-NEXT:    [[TMP2:%.*]] = add nsw <4 x i32> [[WIDE_MASKED_LOAD9]], [[WIDE_MASKED_LOAD]]
; CHECK-NEXT:    call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> [[TMP2]], <4 x i32>* [[LSR_IV1416]], i32 4, <4 x i1> [[TMP1]])
; CHECK-NEXT:    [[INDEX_NEXT]] = add i32 [[INDEX]], 4
; CHECK-NEXT:    [[SCEVGEP]] = getelementptr i32, i32* [[LSR_IV]], i32 4
; CHECK-NEXT:    [[SCEVGEP12]] = getelementptr i32, i32* [[LSR_IV11]], i32 4
; CHECK-NEXT:    [[SCEVGEP15]] = getelementptr i32, i32* [[LSR_IV14]], i32 4
; CHECK-NEXT:    [[TMP3]] = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 [[TMP0]], i32 1)
; CHECK-NEXT:    [[TMP4:%.*]] = icmp ne i32 [[TMP3]], 0
; CHECK-NEXT:    br i1 [[TMP4]], label [[VECTOR_BODY]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  call void @llvm.set.loop.iterations.i32(i32 8001)
  br label %vector.body

vector.body:
  %lsr.iv14 = phi i32* [ %scevgep15, %vector.body ], [ %A, %entry ]
  %lsr.iv11 = phi i32* [ %scevgep12, %vector.body ], [ %C, %entry ]
  %lsr.iv = phi i32* [ %scevgep, %vector.body ], [ %B, %entry ]
  %index = phi i32 [ 0, %entry ], [ %index.next, %vector.body ]
  %0 = phi i32 [ 8001, %entry ], [ %3, %vector.body ]
  %lsr.iv1416 = bitcast i32* %lsr.iv14 to <4 x i32>*
  %lsr.iv1113 = bitcast i32* %lsr.iv11 to <4 x i32>*
  %lsr.iv10 = bitcast i32* %lsr.iv to <4 x i32>*
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %index, i32 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i32> %broadcast.splat, <i32 0, i32 1, i32 2, i32 3>

; UGT here:
  %1 = icmp ugt <4 x i32> %induction, <i32 32002, i32 32002, i32 32002, i32 32002>
  %wide.masked.load = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %lsr.iv10, i32 4, <4 x i1> %1, <4 x i32> undef)
  %wide.masked.load9 = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %lsr.iv1113, i32 4, <4 x i1> %1, <4 x i32> undef)
  %2 = add nsw <4 x i32> %wide.masked.load9, %wide.masked.load
  call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> %2, <4 x i32>* %lsr.iv1416, i32 4, <4 x i1> %1)
  %index.next = add i32 %index, 4
  %scevgep = getelementptr i32, i32* %lsr.iv, i32 4
  %scevgep12 = getelementptr i32, i32* %lsr.iv11, i32 4
  %scevgep15 = getelementptr i32, i32* %lsr.iv14, i32 4
  %3 = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 %0, i32 1)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %vector.body, label %for.cond.cleanup

for.cond.cleanup:
  ret void
}

; Check that this loop behaves as expected, i.e, that the loop increment is
; an increment and not a decrement.
define dso_local void @foo4(i32* noalias nocapture %A, i32* noalias nocapture readonly %B, i32* noalias nocapture readonly %C, i32* noalias nocapture readnone %D, i32 %N) local_unnamed_addr #0 {
; CHECK-LABEL: @foo4(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    call void @llvm.set.loop.iterations.i32(i32 8001)
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[LSR_IV14:%.*]] = phi i32* [ [[SCEVGEP15:%.*]], [[VECTOR_BODY]] ], [ [[A:%.*]], [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[LSR_IV11:%.*]] = phi i32* [ [[SCEVGEP12:%.*]], [[VECTOR_BODY]] ], [ [[C:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32* [ [[SCEVGEP:%.*]], [[VECTOR_BODY]] ], [ [[B:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[INDEX:%.*]] = phi i32 [ 0, [[ENTRY]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = phi i32 [ 8001, [[ENTRY]] ], [ [[TMP3:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[LSR_IV1416:%.*]] = bitcast i32* [[LSR_IV14]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV1113:%.*]] = bitcast i32* [[LSR_IV11]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV10:%.*]] = bitcast i32* [[LSR_IV]] to <4 x i32>*
; CHECK-NEXT:    [[BROADCAST_SPLATINSERT:%.*]] = insertelement <4 x i32> undef, i32 [[INDEX]], i32 0
; CHECK-NEXT:    [[BROADCAST_SPLAT:%.*]] = shufflevector <4 x i32> [[BROADCAST_SPLATINSERT]], <4 x i32> undef, <4 x i32> zeroinitializer
; CHECK-NEXT:    [[INDUCTION:%.*]] = add <4 x i32> [[BROADCAST_SPLAT]], <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    [[TMP1:%.*]] = icmp ult <4 x i32> [[INDUCTION]], <i32 32002, i32 32002, i32 32002, i32 32002>
; CHECK-NEXT:    [[WIDE_MASKED_LOAD:%.*]] = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* [[LSR_IV10]], i32 4, <4 x i1> [[TMP1]], <4 x i32> undef)
; CHECK-NEXT:    [[WIDE_MASKED_LOAD9:%.*]] = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* [[LSR_IV1113]], i32 4, <4 x i1> [[TMP1]], <4 x i32> undef)
; CHECK-NEXT:    [[TMP2:%.*]] = add nsw <4 x i32> [[WIDE_MASKED_LOAD9]], [[WIDE_MASKED_LOAD]]
; CHECK-NEXT:    call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> [[TMP2]], <4 x i32>* [[LSR_IV1416]], i32 4, <4 x i1> [[TMP1]])
; CHECK-NEXT:    [[INDEX_NEXT]] = sub i32 [[INDEX]], 4
; CHECK-NEXT:    [[SCEVGEP]] = getelementptr i32, i32* [[LSR_IV]], i32 4
; CHECK-NEXT:    [[SCEVGEP12]] = getelementptr i32, i32* [[LSR_IV11]], i32 4
; CHECK-NEXT:    [[SCEVGEP15]] = getelementptr i32, i32* [[LSR_IV14]], i32 4
; CHECK-NEXT:    [[TMP3]] = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 [[TMP0]], i32 1)
; CHECK-NEXT:    [[TMP4:%.*]] = icmp ne i32 [[TMP3]], 0
; CHECK-NEXT:    br i1 [[TMP4]], label [[VECTOR_BODY]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  call void @llvm.set.loop.iterations.i32(i32 8001)
  br label %vector.body

vector.body:
  %lsr.iv14 = phi i32* [ %scevgep15, %vector.body ], [ %A, %entry ]
  %lsr.iv11 = phi i32* [ %scevgep12, %vector.body ], [ %C, %entry ]
  %lsr.iv = phi i32* [ %scevgep, %vector.body ], [ %B, %entry ]
  %index = phi i32 [ 0, %entry ], [ %index.next, %vector.body ]
  %0 = phi i32 [ 8001, %entry ], [ %3, %vector.body ]
  %lsr.iv1416 = bitcast i32* %lsr.iv14 to <4 x i32>*
  %lsr.iv1113 = bitcast i32* %lsr.iv11 to <4 x i32>*
  %lsr.iv10 = bitcast i32* %lsr.iv to <4 x i32>*
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %index, i32 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i32> %broadcast.splat, <i32 0, i32 1, i32 2, i32 3>
  %1 = icmp ult <4 x i32> %induction, <i32 32002, i32 32002, i32 32002, i32 32002>
  %wide.masked.load = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %lsr.iv10, i32 4, <4 x i1> %1, <4 x i32> undef)
  %wide.masked.load9 = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %lsr.iv1113, i32 4, <4 x i1> %1, <4 x i32> undef)
  %2 = add nsw <4 x i32> %wide.masked.load9, %wide.masked.load
  call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> %2, <4 x i32>* %lsr.iv1416, i32 4, <4 x i1> %1)

; Counting down:
  %index.next = sub i32 %index, 4
  %scevgep = getelementptr i32, i32* %lsr.iv, i32 4
  %scevgep12 = getelementptr i32, i32* %lsr.iv11, i32 4
  %scevgep15 = getelementptr i32, i32* %lsr.iv14, i32 4
  %3 = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 %0, i32 1)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %vector.body, label %for.cond.cleanup

for.cond.cleanup:
  ret void
}

define dso_local void @foo5(i32* noalias nocapture %A, i32* noalias nocapture readonly %B, i32* noalias nocapture readonly %C, i32* noalias nocapture readnone %D, i32 %N) local_unnamed_addr #0 {
; CHECK-LABEL: @foo5(
; CHECK-NEXT:  entry:
; CHECK-NEXT:    call void @llvm.set.loop.iterations.i32(i32 8001)
; CHECK-NEXT:    br label [[VECTOR_BODY:%.*]]
; CHECK:       vector.body:
; CHECK-NEXT:    [[LSR_IV14:%.*]] = phi i32* [ [[SCEVGEP15:%.*]], [[VECTOR_BODY]] ], [ [[A:%.*]], [[ENTRY:%.*]] ]
; CHECK-NEXT:    [[LSR_IV11:%.*]] = phi i32* [ [[SCEVGEP12:%.*]], [[VECTOR_BODY]] ], [ [[C:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[LSR_IV:%.*]] = phi i32* [ [[SCEVGEP:%.*]], [[VECTOR_BODY]] ], [ [[B:%.*]], [[ENTRY]] ]
; CHECK-NEXT:    [[INDEX:%.*]] = phi i32 [ 0, [[ENTRY]] ], [ [[INDEX_NEXT:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[TMP0:%.*]] = phi i32 [ 8001, [[ENTRY]] ], [ [[TMP3:%.*]], [[VECTOR_BODY]] ]
; CHECK-NEXT:    [[LSR_IV1416:%.*]] = bitcast i32* [[LSR_IV14]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV1113:%.*]] = bitcast i32* [[LSR_IV11]] to <4 x i32>*
; CHECK-NEXT:    [[LSR_IV10:%.*]] = bitcast i32* [[LSR_IV]] to <4 x i32>*
; CHECK-NEXT:    [[BROADCAST_SPLATINSERT:%.*]] = insertelement <4 x i32> undef, i32 [[INDEX]], i32 0
; CHECK-NEXT:    [[BROADCAST_SPLAT:%.*]] = shufflevector <4 x i32> [[BROADCAST_SPLATINSERT]], <4 x i32> undef, <4 x i32> zeroinitializer
; CHECK-NEXT:    [[INDUCTION:%.*]] = add <4 x i32> [[BROADCAST_SPLAT]], <i32 0, i32 1, i32 2, i32 3>
; CHECK-NEXT:    [[TMP1:%.*]] = icmp ult <4 x i32> [[INDUCTION]], <i32 0, i32 3200, i32 32002, i32 32002>
; CHECK-NEXT:    [[WIDE_MASKED_LOAD:%.*]] = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* [[LSR_IV10]], i32 4, <4 x i1> [[TMP1]], <4 x i32> undef)
; CHECK-NEXT:    [[WIDE_MASKED_LOAD9:%.*]] = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* [[LSR_IV1113]], i32 4, <4 x i1> [[TMP1]], <4 x i32> undef)
; CHECK-NEXT:    [[TMP2:%.*]] = add nsw <4 x i32> [[WIDE_MASKED_LOAD9]], [[WIDE_MASKED_LOAD]]
; CHECK-NEXT:    call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> [[TMP2]], <4 x i32>* [[LSR_IV1416]], i32 4, <4 x i1> [[TMP1]])
; CHECK-NEXT:    [[INDEX_NEXT]] = add i32 [[INDEX]], 4
; CHECK-NEXT:    [[SCEVGEP]] = getelementptr i32, i32* [[LSR_IV]], i32 4
; CHECK-NEXT:    [[SCEVGEP12]] = getelementptr i32, i32* [[LSR_IV11]], i32 4
; CHECK-NEXT:    [[SCEVGEP15]] = getelementptr i32, i32* [[LSR_IV14]], i32 4
; CHECK-NEXT:    [[TMP3]] = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 [[TMP0]], i32 1)
; CHECK-NEXT:    [[TMP4:%.*]] = icmp ne i32 [[TMP3]], 0
; CHECK-NEXT:    br i1 [[TMP4]], label [[VECTOR_BODY]], label [[FOR_COND_CLEANUP:%.*]]
; CHECK:       for.cond.cleanup:
; CHECK-NEXT:    ret void
;
entry:
  call void @llvm.set.loop.iterations.i32(i32 8001)
  br label %vector.body

vector.body:
  %lsr.iv14 = phi i32* [ %scevgep15, %vector.body ], [ %A, %entry ]
  %lsr.iv11 = phi i32* [ %scevgep12, %vector.body ], [ %C, %entry ]
  %lsr.iv = phi i32* [ %scevgep, %vector.body ], [ %B, %entry ]
  %index = phi i32 [ 0, %entry ], [ %index.next, %vector.body ]
  %0 = phi i32 [ 8001, %entry ], [ %3, %vector.body ]
  %lsr.iv1416 = bitcast i32* %lsr.iv14 to <4 x i32>*
  %lsr.iv1113 = bitcast i32* %lsr.iv11 to <4 x i32>*
  %lsr.iv10 = bitcast i32* %lsr.iv to <4 x i32>*
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %index, i32 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i32> %broadcast.splat, <i32 0, i32 1, i32 2, i32 3>

; non-uniform constant vector here:
  %1 = icmp ult <4 x i32> %induction, <i32 0, i32 3200, i32 32002, i32 32002>
  %wide.masked.load = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %lsr.iv10, i32 4, <4 x i1> %1, <4 x i32> undef)
  %wide.masked.load9 = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %lsr.iv1113, i32 4, <4 x i1> %1, <4 x i32> undef)
  %2 = add nsw <4 x i32> %wide.masked.load9, %wide.masked.load
  call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> %2, <4 x i32>* %lsr.iv1416, i32 4, <4 x i1> %1)
  %index.next = add i32 %index, 4
  %scevgep = getelementptr i32, i32* %lsr.iv, i32 4
  %scevgep12 = getelementptr i32, i32* %lsr.iv11, i32 4
  %scevgep15 = getelementptr i32, i32* %lsr.iv14, i32 4
  %3 = call i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 %0, i32 1)
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %vector.body, label %for.cond.cleanup

for.cond.cleanup:
  ret void
}

declare <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>*, i32 immarg, <4 x i1>, <4 x i32>) #1
declare void @llvm.masked.store.v4i32.p0v4i32(<4 x i32>, <4 x i32>*, i32 immarg, <4 x i1>) #2
declare i32 @llvm.loop.decrement.reg.i32.i32.i32(i32 , i32 )
declare void @llvm.set.loop.iterations.i32(i32)

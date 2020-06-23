
//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// Autogenerated by gen-libclc-test.py

// RUN: %clang -emit-llvm -S -o - %s | FileCheck %s

#include <spirv/spirv_types.h>

// CHECK-NOT: declare {{.*}} @_Z
// CHECK-NOT: call {{[^ ]*}} bitcast
__attribute__((overloadable)) __clc_int8_t
test___spirv_ocl_select(__clc_int8_t args_0, __clc_int8_t args_1,
                        __clc_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_int8_t
test___spirv_ocl_select(__clc_vec2_int8_t args_0, __clc_vec2_int8_t args_1,
                        __clc_vec2_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_int8_t
test___spirv_ocl_select(__clc_vec3_int8_t args_0, __clc_vec3_int8_t args_1,
                        __clc_vec3_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_int8_t
test___spirv_ocl_select(__clc_vec4_int8_t args_0, __clc_vec4_int8_t args_1,
                        __clc_vec4_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_int8_t
test___spirv_ocl_select(__clc_vec8_int8_t args_0, __clc_vec8_int8_t args_1,
                        __clc_vec8_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_int8_t
test___spirv_ocl_select(__clc_vec16_int8_t args_0, __clc_vec16_int8_t args_1,
                        __clc_vec16_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_int16_t
test___spirv_ocl_select(__clc_int16_t args_0, __clc_int16_t args_1,
                        __clc_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_int16_t
test___spirv_ocl_select(__clc_vec2_int16_t args_0, __clc_vec2_int16_t args_1,
                        __clc_vec2_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_int16_t
test___spirv_ocl_select(__clc_vec3_int16_t args_0, __clc_vec3_int16_t args_1,
                        __clc_vec3_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_int16_t
test___spirv_ocl_select(__clc_vec4_int16_t args_0, __clc_vec4_int16_t args_1,
                        __clc_vec4_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_int16_t
test___spirv_ocl_select(__clc_vec8_int16_t args_0, __clc_vec8_int16_t args_1,
                        __clc_vec8_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_int16_t
test___spirv_ocl_select(__clc_vec16_int16_t args_0, __clc_vec16_int16_t args_1,
                        __clc_vec16_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_int32_t
test___spirv_ocl_select(__clc_int32_t args_0, __clc_int32_t args_1,
                        __clc_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_int32_t
test___spirv_ocl_select(__clc_vec2_int32_t args_0, __clc_vec2_int32_t args_1,
                        __clc_vec2_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_int32_t
test___spirv_ocl_select(__clc_vec3_int32_t args_0, __clc_vec3_int32_t args_1,
                        __clc_vec3_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_int32_t
test___spirv_ocl_select(__clc_vec4_int32_t args_0, __clc_vec4_int32_t args_1,
                        __clc_vec4_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_int32_t
test___spirv_ocl_select(__clc_vec8_int32_t args_0, __clc_vec8_int32_t args_1,
                        __clc_vec8_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_int32_t
test___spirv_ocl_select(__clc_vec16_int32_t args_0, __clc_vec16_int32_t args_1,
                        __clc_vec16_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_int64_t
test___spirv_ocl_select(__clc_int64_t args_0, __clc_int64_t args_1,
                        __clc_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_int64_t
test___spirv_ocl_select(__clc_vec2_int64_t args_0, __clc_vec2_int64_t args_1,
                        __clc_vec2_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_int64_t
test___spirv_ocl_select(__clc_vec3_int64_t args_0, __clc_vec3_int64_t args_1,
                        __clc_vec3_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_int64_t
test___spirv_ocl_select(__clc_vec4_int64_t args_0, __clc_vec4_int64_t args_1,
                        __clc_vec4_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_int64_t
test___spirv_ocl_select(__clc_vec8_int64_t args_0, __clc_vec8_int64_t args_1,
                        __clc_vec8_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_int64_t
test___spirv_ocl_select(__clc_vec16_int64_t args_0, __clc_vec16_int64_t args_1,
                        __clc_vec16_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_int8_t
test___spirv_ocl_select(__clc_int8_t args_0, __clc_int8_t args_1,
                        __clc_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_int8_t
test___spirv_ocl_select(__clc_vec2_int8_t args_0, __clc_vec2_int8_t args_1,
                        __clc_vec2_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_int8_t
test___spirv_ocl_select(__clc_vec3_int8_t args_0, __clc_vec3_int8_t args_1,
                        __clc_vec3_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_int8_t
test___spirv_ocl_select(__clc_vec4_int8_t args_0, __clc_vec4_int8_t args_1,
                        __clc_vec4_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_int8_t
test___spirv_ocl_select(__clc_vec8_int8_t args_0, __clc_vec8_int8_t args_1,
                        __clc_vec8_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_int8_t
test___spirv_ocl_select(__clc_vec16_int8_t args_0, __clc_vec16_int8_t args_1,
                        __clc_vec16_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_int16_t
test___spirv_ocl_select(__clc_int16_t args_0, __clc_int16_t args_1,
                        __clc_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_int16_t
test___spirv_ocl_select(__clc_vec2_int16_t args_0, __clc_vec2_int16_t args_1,
                        __clc_vec2_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_int16_t
test___spirv_ocl_select(__clc_vec3_int16_t args_0, __clc_vec3_int16_t args_1,
                        __clc_vec3_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_int16_t
test___spirv_ocl_select(__clc_vec4_int16_t args_0, __clc_vec4_int16_t args_1,
                        __clc_vec4_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_int16_t
test___spirv_ocl_select(__clc_vec8_int16_t args_0, __clc_vec8_int16_t args_1,
                        __clc_vec8_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_int16_t
test___spirv_ocl_select(__clc_vec16_int16_t args_0, __clc_vec16_int16_t args_1,
                        __clc_vec16_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_int32_t
test___spirv_ocl_select(__clc_int32_t args_0, __clc_int32_t args_1,
                        __clc_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_int32_t
test___spirv_ocl_select(__clc_vec2_int32_t args_0, __clc_vec2_int32_t args_1,
                        __clc_vec2_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_int32_t
test___spirv_ocl_select(__clc_vec3_int32_t args_0, __clc_vec3_int32_t args_1,
                        __clc_vec3_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_int32_t
test___spirv_ocl_select(__clc_vec4_int32_t args_0, __clc_vec4_int32_t args_1,
                        __clc_vec4_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_int32_t
test___spirv_ocl_select(__clc_vec8_int32_t args_0, __clc_vec8_int32_t args_1,
                        __clc_vec8_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_int32_t
test___spirv_ocl_select(__clc_vec16_int32_t args_0, __clc_vec16_int32_t args_1,
                        __clc_vec16_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_int64_t
test___spirv_ocl_select(__clc_int64_t args_0, __clc_int64_t args_1,
                        __clc_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_int64_t
test___spirv_ocl_select(__clc_vec2_int64_t args_0, __clc_vec2_int64_t args_1,
                        __clc_vec2_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_int64_t
test___spirv_ocl_select(__clc_vec3_int64_t args_0, __clc_vec3_int64_t args_1,
                        __clc_vec3_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_int64_t
test___spirv_ocl_select(__clc_vec4_int64_t args_0, __clc_vec4_int64_t args_1,
                        __clc_vec4_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_int64_t
test___spirv_ocl_select(__clc_vec8_int64_t args_0, __clc_vec8_int64_t args_1,
                        __clc_vec8_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_int64_t
test___spirv_ocl_select(__clc_vec16_int64_t args_0, __clc_vec16_int64_t args_1,
                        __clc_vec16_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_uint8_t
test___spirv_ocl_select(__clc_uint8_t args_0, __clc_uint8_t args_1,
                        __clc_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_uint8_t
test___spirv_ocl_select(__clc_vec2_uint8_t args_0, __clc_vec2_uint8_t args_1,
                        __clc_vec2_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_uint8_t
test___spirv_ocl_select(__clc_vec3_uint8_t args_0, __clc_vec3_uint8_t args_1,
                        __clc_vec3_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_uint8_t
test___spirv_ocl_select(__clc_vec4_uint8_t args_0, __clc_vec4_uint8_t args_1,
                        __clc_vec4_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_uint8_t
test___spirv_ocl_select(__clc_vec8_uint8_t args_0, __clc_vec8_uint8_t args_1,
                        __clc_vec8_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_uint8_t
test___spirv_ocl_select(__clc_vec16_uint8_t args_0, __clc_vec16_uint8_t args_1,
                        __clc_vec16_uint8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_uint16_t
test___spirv_ocl_select(__clc_uint16_t args_0, __clc_uint16_t args_1,
                        __clc_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_uint16_t
test___spirv_ocl_select(__clc_vec2_uint16_t args_0, __clc_vec2_uint16_t args_1,
                        __clc_vec2_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_uint16_t
test___spirv_ocl_select(__clc_vec3_uint16_t args_0, __clc_vec3_uint16_t args_1,
                        __clc_vec3_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_uint16_t
test___spirv_ocl_select(__clc_vec4_uint16_t args_0, __clc_vec4_uint16_t args_1,
                        __clc_vec4_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_uint16_t
test___spirv_ocl_select(__clc_vec8_uint16_t args_0, __clc_vec8_uint16_t args_1,
                        __clc_vec8_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_uint16_t
test___spirv_ocl_select(__clc_vec16_uint16_t args_0,
                        __clc_vec16_uint16_t args_1,
                        __clc_vec16_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_uint32_t
test___spirv_ocl_select(__clc_uint32_t args_0, __clc_uint32_t args_1,
                        __clc_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_uint32_t
test___spirv_ocl_select(__clc_vec2_uint32_t args_0, __clc_vec2_uint32_t args_1,
                        __clc_vec2_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_uint32_t
test___spirv_ocl_select(__clc_vec3_uint32_t args_0, __clc_vec3_uint32_t args_1,
                        __clc_vec3_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_uint32_t
test___spirv_ocl_select(__clc_vec4_uint32_t args_0, __clc_vec4_uint32_t args_1,
                        __clc_vec4_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_uint32_t
test___spirv_ocl_select(__clc_vec8_uint32_t args_0, __clc_vec8_uint32_t args_1,
                        __clc_vec8_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_uint32_t
test___spirv_ocl_select(__clc_vec16_uint32_t args_0,
                        __clc_vec16_uint32_t args_1,
                        __clc_vec16_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_uint64_t
test___spirv_ocl_select(__clc_uint64_t args_0, __clc_uint64_t args_1,
                        __clc_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_uint64_t
test___spirv_ocl_select(__clc_vec2_uint64_t args_0, __clc_vec2_uint64_t args_1,
                        __clc_vec2_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_uint64_t
test___spirv_ocl_select(__clc_vec3_uint64_t args_0, __clc_vec3_uint64_t args_1,
                        __clc_vec3_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_uint64_t
test___spirv_ocl_select(__clc_vec4_uint64_t args_0, __clc_vec4_uint64_t args_1,
                        __clc_vec4_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_uint64_t
test___spirv_ocl_select(__clc_vec8_uint64_t args_0, __clc_vec8_uint64_t args_1,
                        __clc_vec8_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_uint64_t
test___spirv_ocl_select(__clc_vec16_uint64_t args_0,
                        __clc_vec16_uint64_t args_1,
                        __clc_vec16_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_uint8_t
test___spirv_ocl_select(__clc_uint8_t args_0, __clc_uint8_t args_1,
                        __clc_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_uint8_t
test___spirv_ocl_select(__clc_vec2_uint8_t args_0, __clc_vec2_uint8_t args_1,
                        __clc_vec2_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_uint8_t
test___spirv_ocl_select(__clc_vec3_uint8_t args_0, __clc_vec3_uint8_t args_1,
                        __clc_vec3_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_uint8_t
test___spirv_ocl_select(__clc_vec4_uint8_t args_0, __clc_vec4_uint8_t args_1,
                        __clc_vec4_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_uint8_t
test___spirv_ocl_select(__clc_vec8_uint8_t args_0, __clc_vec8_uint8_t args_1,
                        __clc_vec8_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_uint8_t
test___spirv_ocl_select(__clc_vec16_uint8_t args_0, __clc_vec16_uint8_t args_1,
                        __clc_vec16_int8_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_uint16_t
test___spirv_ocl_select(__clc_uint16_t args_0, __clc_uint16_t args_1,
                        __clc_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_uint16_t
test___spirv_ocl_select(__clc_vec2_uint16_t args_0, __clc_vec2_uint16_t args_1,
                        __clc_vec2_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_uint16_t
test___spirv_ocl_select(__clc_vec3_uint16_t args_0, __clc_vec3_uint16_t args_1,
                        __clc_vec3_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_uint16_t
test___spirv_ocl_select(__clc_vec4_uint16_t args_0, __clc_vec4_uint16_t args_1,
                        __clc_vec4_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_uint16_t
test___spirv_ocl_select(__clc_vec8_uint16_t args_0, __clc_vec8_uint16_t args_1,
                        __clc_vec8_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_uint16_t
test___spirv_ocl_select(__clc_vec16_uint16_t args_0,
                        __clc_vec16_uint16_t args_1,
                        __clc_vec16_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_uint32_t
test___spirv_ocl_select(__clc_uint32_t args_0, __clc_uint32_t args_1,
                        __clc_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_uint32_t
test___spirv_ocl_select(__clc_vec2_uint32_t args_0, __clc_vec2_uint32_t args_1,
                        __clc_vec2_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_uint32_t
test___spirv_ocl_select(__clc_vec3_uint32_t args_0, __clc_vec3_uint32_t args_1,
                        __clc_vec3_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_uint32_t
test___spirv_ocl_select(__clc_vec4_uint32_t args_0, __clc_vec4_uint32_t args_1,
                        __clc_vec4_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_uint32_t
test___spirv_ocl_select(__clc_vec8_uint32_t args_0, __clc_vec8_uint32_t args_1,
                        __clc_vec8_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_uint32_t
test___spirv_ocl_select(__clc_vec16_uint32_t args_0,
                        __clc_vec16_uint32_t args_1,
                        __clc_vec16_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_uint64_t
test___spirv_ocl_select(__clc_uint64_t args_0, __clc_uint64_t args_1,
                        __clc_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_uint64_t
test___spirv_ocl_select(__clc_vec2_uint64_t args_0, __clc_vec2_uint64_t args_1,
                        __clc_vec2_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_uint64_t
test___spirv_ocl_select(__clc_vec3_uint64_t args_0, __clc_vec3_uint64_t args_1,
                        __clc_vec3_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_uint64_t
test___spirv_ocl_select(__clc_vec4_uint64_t args_0, __clc_vec4_uint64_t args_1,
                        __clc_vec4_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_uint64_t
test___spirv_ocl_select(__clc_vec8_uint64_t args_0, __clc_vec8_uint64_t args_1,
                        __clc_vec8_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_uint64_t
test___spirv_ocl_select(__clc_vec16_uint64_t args_0,
                        __clc_vec16_uint64_t args_1,
                        __clc_vec16_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_fp32_t
test___spirv_ocl_select(__clc_fp32_t args_0, __clc_fp32_t args_1,
                        __clc_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_fp32_t
test___spirv_ocl_select(__clc_vec2_fp32_t args_0, __clc_vec2_fp32_t args_1,
                        __clc_vec2_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_fp32_t
test___spirv_ocl_select(__clc_vec3_fp32_t args_0, __clc_vec3_fp32_t args_1,
                        __clc_vec3_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_fp32_t
test___spirv_ocl_select(__clc_vec4_fp32_t args_0, __clc_vec4_fp32_t args_1,
                        __clc_vec4_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_fp32_t
test___spirv_ocl_select(__clc_vec8_fp32_t args_0, __clc_vec8_fp32_t args_1,
                        __clc_vec8_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_fp32_t
test___spirv_ocl_select(__clc_vec16_fp32_t args_0, __clc_vec16_fp32_t args_1,
                        __clc_vec16_uint32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_fp64_t
test___spirv_ocl_select(__clc_fp64_t args_0, __clc_fp64_t args_1,
                        __clc_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec2_fp64_t
test___spirv_ocl_select(__clc_vec2_fp64_t args_0, __clc_vec2_fp64_t args_1,
                        __clc_vec2_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec3_fp64_t
test___spirv_ocl_select(__clc_vec3_fp64_t args_0, __clc_vec3_fp64_t args_1,
                        __clc_vec3_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec4_fp64_t
test___spirv_ocl_select(__clc_vec4_fp64_t args_0, __clc_vec4_fp64_t args_1,
                        __clc_vec4_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec8_fp64_t
test___spirv_ocl_select(__clc_vec8_fp64_t args_0, __clc_vec8_fp64_t args_1,
                        __clc_vec8_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec16_fp64_t
test___spirv_ocl_select(__clc_vec16_fp64_t args_0, __clc_vec16_fp64_t args_1,
                        __clc_vec16_uint64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_fp16_t
test___spirv_ocl_select(__clc_fp16_t args_0, __clc_fp16_t args_1,
                        __clc_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec2_fp16_t
test___spirv_ocl_select(__clc_vec2_fp16_t args_0, __clc_vec2_fp16_t args_1,
                        __clc_vec2_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec3_fp16_t
test___spirv_ocl_select(__clc_vec3_fp16_t args_0, __clc_vec3_fp16_t args_1,
                        __clc_vec3_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec4_fp16_t
test___spirv_ocl_select(__clc_vec4_fp16_t args_0, __clc_vec4_fp16_t args_1,
                        __clc_vec4_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec8_fp16_t
test___spirv_ocl_select(__clc_vec8_fp16_t args_0, __clc_vec8_fp16_t args_1,
                        __clc_vec8_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec16_fp16_t
test___spirv_ocl_select(__clc_vec16_fp16_t args_0, __clc_vec16_fp16_t args_1,
                        __clc_vec16_uint16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
__attribute__((overloadable)) __clc_fp32_t
test___spirv_ocl_select(__clc_fp32_t args_0, __clc_fp32_t args_1,
                        __clc_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec2_fp32_t
test___spirv_ocl_select(__clc_vec2_fp32_t args_0, __clc_vec2_fp32_t args_1,
                        __clc_vec2_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec3_fp32_t
test___spirv_ocl_select(__clc_vec3_fp32_t args_0, __clc_vec3_fp32_t args_1,
                        __clc_vec3_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec4_fp32_t
test___spirv_ocl_select(__clc_vec4_fp32_t args_0, __clc_vec4_fp32_t args_1,
                        __clc_vec4_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec8_fp32_t
test___spirv_ocl_select(__clc_vec8_fp32_t args_0, __clc_vec8_fp32_t args_1,
                        __clc_vec8_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

__attribute__((overloadable)) __clc_vec16_fp32_t
test___spirv_ocl_select(__clc_vec16_fp32_t args_0, __clc_vec16_fp32_t args_1,
                        __clc_vec16_int32_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_fp64_t
test___spirv_ocl_select(__clc_fp64_t args_0, __clc_fp64_t args_1,
                        __clc_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec2_fp64_t
test___spirv_ocl_select(__clc_vec2_fp64_t args_0, __clc_vec2_fp64_t args_1,
                        __clc_vec2_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec3_fp64_t
test___spirv_ocl_select(__clc_vec3_fp64_t args_0, __clc_vec3_fp64_t args_1,
                        __clc_vec3_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec4_fp64_t
test___spirv_ocl_select(__clc_vec4_fp64_t args_0, __clc_vec4_fp64_t args_1,
                        __clc_vec4_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec8_fp64_t
test___spirv_ocl_select(__clc_vec8_fp64_t args_0, __clc_vec8_fp64_t args_1,
                        __clc_vec8_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp64
__attribute__((overloadable)) __clc_vec16_fp64_t
test___spirv_ocl_select(__clc_vec16_fp64_t args_0, __clc_vec16_fp64_t args_1,
                        __clc_vec16_int64_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_fp16_t
test___spirv_ocl_select(__clc_fp16_t args_0, __clc_fp16_t args_1,
                        __clc_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec2_fp16_t
test___spirv_ocl_select(__clc_vec2_fp16_t args_0, __clc_vec2_fp16_t args_1,
                        __clc_vec2_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec3_fp16_t
test___spirv_ocl_select(__clc_vec3_fp16_t args_0, __clc_vec3_fp16_t args_1,
                        __clc_vec3_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec4_fp16_t
test___spirv_ocl_select(__clc_vec4_fp16_t args_0, __clc_vec4_fp16_t args_1,
                        __clc_vec4_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec8_fp16_t
test___spirv_ocl_select(__clc_vec8_fp16_t args_0, __clc_vec8_fp16_t args_1,
                        __clc_vec8_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif
#ifdef cl_khr_fp16
__attribute__((overloadable)) __clc_vec16_fp16_t
test___spirv_ocl_select(__clc_vec16_fp16_t args_0, __clc_vec16_fp16_t args_1,
                        __clc_vec16_int16_t args_2) {
  return __spirv_ocl_select(args_0, args_1, args_2);
}

#endif

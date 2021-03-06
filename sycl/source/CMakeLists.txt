#To-Do:
#1. Figure out why CMP0057 has to be set. Should have been taken care of earlier in the build
#2. Use AddLLVM to modify the build and access config options
#cmake_policy(SET CMP0057 NEW)
#include(AddLLVM)

if(MSVC)
  add_definitions(-D__SYCL_BUILD_SYCL_DLL)
endif()

add_library(sycl SHARED
  "${sycl_inc_dir}/CL/sycl.hpp"
  "detail/builtins_common.cpp"
  "detail/builtins_geometric.cpp"
  "detail/builtins_integer.cpp"
  "detail/builtins_math.cpp"
  "detail/builtins_relational.cpp"
  "detail/pi.cpp"
  "detail/pi_opencl.cpp"
  "detail/common.cpp"
  "detail/context_impl.cpp"
  "detail/device_impl.cpp"
  "detail/device_info.cpp"
  "detail/event_impl.cpp"
  "detail/force_device.cpp"
  "detail/helpers.cpp"
  "detail/image_impl.cpp"
  "detail/kernel_impl.cpp"
  "detail/kernel_info.cpp"
  "detail/memory_manager.cpp"
  "detail/platform_impl.cpp"
  "detail/platform_info.cpp"
  "detail/program_impl.cpp"
  "detail/program_manager/program_manager.cpp"
  "detail/queue_impl.cpp"
  "detail/os_util.cpp"
  "detail/platform_util.cpp"
  "detail/sampler_impl.cpp"
  "detail/stream_impl.cpp"
  "detail/scheduler/commands.cpp"
  "detail/scheduler/scheduler.cpp"
  "detail/scheduler/graph_processor.cpp"
  "detail/scheduler/graph_builder.cpp"
  "detail/usm/clusm.cpp"
  "detail/usm/opencl_shim.cpp"
  "detail/usm/usm_impl.cpp"
  "detail/util.cpp"
  "context.cpp"
  "device.cpp"
  "device_selector.cpp"
  "event.cpp"
  "exception.cpp"
  "exception_list.cpp"
  "half_type.cpp"
  "kernel.cpp"
  "platform.cpp"
  "queue.cpp"
  "sampler.cpp"
  "stream.cpp"
  "spirv_ops.cpp"
)

add_dependencies(sycl
  ocl-icd
  ocl-headers
  sycl-headers
)

set_target_properties(sycl PROPERTIES LINKER_LANGUAGE CXX)

# Workaround for bug in GCC version 5 and higher.
# More information https://bugs.launchpad.net/ubuntu/+source/gcc-5/+bug/1568899
if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU" AND
    CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 5.0)
  target_link_libraries(sycl gcc_s gcc)
endif()

install(TARGETS sycl DESTINATION "lib" COMPONENT sycl)

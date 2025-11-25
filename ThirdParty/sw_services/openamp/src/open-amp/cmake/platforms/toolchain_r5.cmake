# this file matches the toolchain.cmake file produced by Vitis
set (CMAKE_SYSTEM_PROCESSOR "arm" CACHE STRING "")
set (MACHINE "zynqmp_r5")
set (CROSS_PREFIX "armr5-none-eabi-" CACHE STRING "")

# point to vitis-generated includes
set(CMAKE_INCLUDE_PATH "${CMAKE_SOURCE_DIR}/../../../../../../vitis/mb_rtos_system/export/mb_rtos_system/sw/mb_rtos_system/psu_cortexr5_0/bspinclude/include/")
message("CMAKE_SOURCE_DIR:    ${CMAKE_SOURCE_DIR}")
message("CMAKE_INCLUDE_PATH:  ${CMAKE_INCLUDE_PATH}")
set (CMAKE_C_FLAGS "-O2 -c \
  -mcpu=cortex-r5 -g -DARMR5 -Wall -Wextra -mfloat-abi=hard \
  -mfpu=vfpv3-d16 -fno-tree-loop-distribute-patterns -DUNDEFINE_FILE_OPS \
  -I${CMAKE_INCLUDE_PATH}"
  CACHE STRING "")

set (CMAKE_SYSTEM_NAME "FreeRTOS" CACHE STRING "")
include (CMakeForceCompiler)
CMAKE_FORCE_C_COMPILER ("${CROSS_PREFIX}gcc" GNU)
CMAKE_FORCE_CXX_COMPILER ("${CROSS_PREFIX}g++" GNU)
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER CACHE STRING "")
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY NEVER CACHE STRING "")
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE NEVER CACHE STRING "")

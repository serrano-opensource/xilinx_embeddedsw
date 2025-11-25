# this file matches the toolchain.cmake file produced by Vitis
# for the MB standalone BSP
set (CMAKE_SYSTEM_PROCESSOR "microblaze" CACHE STRING "")
set (MACHINE "microblaze")
set (CROSS_PREFIX "mb-" CACHE STRING "")

# point to vitis-generated includes
set(VITIS_INCLUDE_PATH
    "${CMAKE_SOURCE_DIR}/../../../../../../vitis/mb_rtos_system/export/mb_rtos_system/sw/mb_rtos_system/freertos10_xilinx_domain/bspinclude/include")
set(METAL_INCLUDE_PATH
   "${CMAKE_SOURCE_DIR}/../../../../../../vitis/ext_lib/mb/libmetal/include")

set (CMAKE_C_FLAGS " -mlittle-endian \
    -mxl-barrel-shift -mxl-pattern-compare -mno-xl-soft-mul -mno-xl-reorder -mcpu=v11.0 \
    -mlittle-endian -g -ffunction-sections -fdata-sections -Wall -Wextra -fno-tree-loop-distribute-patterns \
    -DHAS_XINTC \
    -I${VITIS_INCLUDE_PATH} -I${METAL_INCLUDE_PATH}" CACHE STRING "")

set (CMAKE_SYSTEM_NAME "FreeRTOS" CACHE STRING "")
include (CMakeForceCompiler)
CMAKE_FORCE_C_COMPILER ("${CROSS_PREFIX}gcc" GNU)
CMAKE_FORCE_CXX_COMPILER ("${CROSS_PREFIX}g++" GNU)
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER CACHE STRING "")
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY NEVER CACHE STRING "")
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE NEVER CACHE STRING "")

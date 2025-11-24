cmake_minimum_required (VERSION 2.6)

list (APPEND CMAKE_MODULE_PATH
      "${CMAKE_SOURCE_DIR}/cmake"
      "${CMAKE_SOURCE_DIR}/cmake/modules"
      "${CMAKE_SOURCE_DIR}/cmake/platforms")

include (syscheck)
project (metal C)

include (CheckIncludeFiles)
include (CheckCSourceCompiles)
include (collect)
include (options)
include (depends)

# point to vitis-generated includes
set(CMAKE_INCLUDE_PATH "${CMAKE_SOURCE_DIR}/../../../../../../vitis/mb_system/microblaze_0/standalone_microblaze_0/bsp/microblaze_0/include")
message("MACHINE:            ${MACHINE}")
message("CMAKE_SOURCE_DIR:   ${CMAKE_SOURCE_DIR}")
message("CMAKE_INCLUDE_PATH: ${CMAKE_INCLUDE_PATH}")
foreach(_inc_path ${CMAKE_INCLUDE_PATH})
  collect (PROJECT_INC_DIRS "${_inc_path}")
endforeach()
message("PROJECT_INC_DIRS: ${PROJECT_INC_DIRS}")
enable_testing ()

add_subdirectory (lib)

if (WITH_TESTS)
  add_subdirectory (test)
endif (WITH_TESTS)

if (WITH_DOC)
  add_subdirectory (doc)
endif (WITH_DOC)

if (WITH_EXAMPLES)
  add_subdirectory (examples)
endif (WITH_EXAMPLES)

# vim: expandtab:ts=2:sw=2:smartindent

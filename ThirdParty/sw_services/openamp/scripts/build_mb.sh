#!/bin/bash
#
# builds the MB version of open-amp library
set -e

if [[ -d "../build_mb" ]]; then
	pushd ../build_mb
	rm -rf *
else
	mkdir ../build_mb
	pushd ../build_mb
fi

cmake ../src/open-amp/ -DCMAKE_TOOLCHAIN_FILE="../src/open-amp/cmake/platforms/toolchain_mb.cmake" \
 -DWITH_LIBMETAL_FIND=off \
 -DWITH_PROXY=true -DCMAKE_VERBOSE_MAKEFILE=on

make open_amp-static

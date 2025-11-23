#!/bin/bash
#
# builds the R5 version of open-amp library
set -e

if [[ -d "../build_r5" ]]; then
	pushd ../build_r5
	rm -rf *
else
	mkdir ../build_r5
	pushd ../build_r5
fi

cmake ../src/open-amp/ -DCMAKE_TOOLCHAIN_FILE="../src/open-amp/cmake/platforms/toolchain_r5.cmake" \
 -DWITH_LIBMETAL_FIND=off \
 -DWITH_PROXY=true -DCMAKE_VERBOSE_MAKEFILE=on

make open_amp-static

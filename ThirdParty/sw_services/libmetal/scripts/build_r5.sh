#!/bin/bash
#
# builds the R5 version of libmetal library
set -e

if [[ -d "../build_r5" ]]; then
	pushd ../build_r5
	rm -rf *
else
	mkdir ../build_r5
	pushd ../build_r5
fi

cmake ../src/libmetal/ -DCMAKE_TOOLCHAIN_FILE="../src/libmetal/cmake/platforms/toolchain_r5.cmake" \
 -DWITH_DOC=off -DWITH_DEFAULT_LOGGER=off

make metal-static

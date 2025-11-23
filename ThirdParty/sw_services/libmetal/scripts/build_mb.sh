#!/bin/bash
#
# builds the MicroBlaze version of libmetal library
set -e

if [[ -d "../build_mb" ]]; then
	pushd ../build_mb
	rm -rf *
else
	mkdir ../build_mb
	pushd ../build_mb
fi

cmake ../src/libmetal/ -DCMAKE_TOOLCHAIN_FILE="../src/libmetal/cmake/platforms/toolchain_mb.cmake" \
 -DWITH_DOC=off -DWITH_DEFAULT_LOGGER=off

make metal-static

popd

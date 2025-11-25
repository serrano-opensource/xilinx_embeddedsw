#!/bin/bash
#
# builds the MicroBlaze version of libmetal library
set -e

# destination for the library and include files
DEST="../../../../../vitis/ext_lib/mb/libmetal"
BUILD="../build_mb/"

# clean any existing files
rm -rf $BUILD
rm -rf $DEST

mkdir -p $BUILD
mkdir -p $DEST

pushd $BUILD
cmake ../src/libmetal/ \
 -DCMAKE_TOOLCHAIN_FILE="../src/libmetal/cmake/platforms/toolchain_mb.cmake" \
 -DWITH_DOC=off -DWITH_DEFAULT_LOGGER=off
popd

make VERBOSE=1 -C $BUILD metal-static

# copy includes and built library
mkdir -p $DEST/include/
cp -R ../build_mb/lib/include/metal $DEST/include/
cp ../build_mb/lib/libmetal.a $DEST

#!/bin/bash
#
# builds the R5 version of libmetal library
set -e

# destination for the library and include files
DEST="../../../../../vitis/ext_lib/r5/libmetal"
BUILD="../build_r5/"

# clean any existing files
rm -rf $BUILD
rm -rf $DEST

mkdir -p $BUILD
mkdir -p $DEST

pushd $BUILD
cmake ../src/libmetal/ \
 -DCMAKE_TOOLCHAIN_FILE="../src/libmetal/cmake/platforms/toolchain_r5.cmake" \
 -DWITH_DOC=off -DWITH_DEFAULT_LOGGER=off
popd

make VERBOSE=1 -C $BUILD metal-static

# copy includes and built library
mkdir -p $DEST/include/
cp -R ../build_r5/lib/include/metal $DEST/include/
cp ../build_r5/lib/libmetal.a $DEST

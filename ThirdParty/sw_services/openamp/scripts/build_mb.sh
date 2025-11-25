#!/bin/bash
#
# builds the MB version of open-amp library
set -e

# destination for the library and include files
DEST="../../../../../vitis/ext_lib/mb/open-amp"
BUILD="../build_mb/"

# clean any existing files
rm -rf $BUILD
rm -rf $DEST

mkdir -p $BUILD
mkdir -p $DEST

pushd $BUILD
cmake ../src/open-amp/ -DCMAKE_TOOLCHAIN_FILE="../src/open-amp/cmake/platforms/toolchain_mb.cmake" \
 -DWITH_LIBMETAL_FIND=off \
 -DWITH_PROXY=true -DCMAKE_VERBOSE_MAKEFILE=on
popd

make VERBOSE=1 -C $BUILD open_amp-static

# copy includes and built library
mkdir -p $DEST/include/
cp -R ../src/open-amp/lib/include/openamp $DEST/include/
cp $BUILD/lib/libopen_amp.a $DEST

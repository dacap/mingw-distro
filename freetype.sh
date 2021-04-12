#!/bin/sh

source ./0_append_distro_path.sh

untar_file freetype-2.10.1.tar

cd $X_DISTRO_TEMP/gcc
mv freetype-2.10.1 src
mkdir build dest
cd build

../src/configure --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32 --disable-shared \
--prefix=$X_DISTRO_TEMP/gcc/dest "CFLAGS=-s -O3"

make $X_MAKE_JOBS all
make $X_MAKE_JOBS install
cd $X_DISTRO_TEMP/gcc
rm -rf build src
mv dest freetype-2.10.1
cd freetype-2.10.1
rm -rf lib/pkgconfig lib/*.la share

7z -mx0 a ../freetype-2.10.1.7z *

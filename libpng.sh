#!/bin/sh

source ./0_append_distro_path.sh

untar_file libpng-1.6.37.tar

cd $X_DISTRO_TEMP/gcc
mv libpng-1.6.37 src
mkdir build dest
cd build

../src/configure --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32 \
--prefix=$X_DISTRO_TEMP/gcc/dest --disable-shared

make $X_MAKE_JOBS all "CFLAGS=-s -O3"
make $X_MAKE_JOBS install
cd $X_DISTRO_TEMP/gcc
rm -rf build src
mv dest libpng-1.6.37
cd libpng-1.6.37
rm -rf bin include/libpng16 lib/pkgconfig lib/*.la lib/libpng16.a share

7z -mx0 a ../libpng-1.6.37.7z *

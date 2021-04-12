#!/bin/sh

source ./0_append_distro_path.sh

untar_file pcre-8.43.tar

cd $X_DISTRO_TEMP/gcc
mv pcre-8.43 src
mkdir build dest
cd build

../src/configure --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32 \
--prefix=$X_DISTRO_TEMP/gcc/dest --disable-shared --enable-utf --enable-unicode-properties --enable-pcre16 --enable-pcre32 \
--enable-jit --enable-newline-is-anycrlf "CFLAGS=-s -O3" "CXXFLAGS=-s -O3"

make $X_MAKE_JOBS all
make $X_MAKE_JOBS install
cd $X_DISTRO_TEMP/gcc
rm -rf build src
mv dest pcre-8.43
cd pcre-8.43
rm -rf bin/pcre-config lib/pkgconfig lib/*.la share
cp include/pcreposix.h include/regex.h

7z -mx0 a ../pcre-8.43.7z *

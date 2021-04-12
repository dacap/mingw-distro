#!/bin/sh

source ./0_append_distro_path.sh

untar_file pcre2-10.34.tar

cd $X_DISTRO_TEMP/gcc
mv pcre2-10.34 src
mkdir build dest
cd build

../src/configure --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32 \
--prefix=$X_DISTRO_TEMP/gcc/dest --disable-shared --enable-pcre2-16 --enable-pcre2-32 \
--enable-jit --enable-newline-is-anycrlf "CFLAGS=-s -O3"

make $X_MAKE_JOBS all
make $X_MAKE_JOBS install
cd $X_DISTRO_TEMP/gcc
rm -rf build src
mv dest pcre2-10.34
cd pcre2-10.34
rm -rf bin/pcre2-config lib/pkgconfig lib/*.la share
# Avoid colliding with the original PCRE library.
# cp include/pcre2posix.h include/regex.h

7z -mx0 a ../pcre2-10.34.7z *

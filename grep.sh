#!/bin/sh

source ./0_append_distro_path.sh

untar_file grep-3.3.tar

patch -d $X_DISTRO_TEMP/gcc/grep-3.3 -p1 < grep-lock.patch

cd $X_DISTRO_TEMP/gcc
mkdir -p dest/bin

mv grep-3.3 src
mkdir build
cd build

../src/configure --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32 \
--prefix=$X_DISTRO_TEMP/gcc/dest --disable-nls "CFLAGS=-s -O3 -DPCRE_STATIC"

make $X_MAKE_JOBS
mv src/grep.exe ../dest/bin
cd $X_DISTRO_TEMP/gcc
rm -rf build src

mv dest grep-3.3
cd grep-3.3

7z -mx0 a ../grep-3.3.7z *

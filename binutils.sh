#!/bin/sh

source ./0_append_distro_path.sh

untar_file binutils-2.33.1.tar

cd $X_DISTRO_TEMP/gcc
mv binutils-2.33.1 src
mkdir build dest
cd build

../src/configure --disable-nls --disable-shared --build=x86_64-w64-mingw32 --host=x86_64-w64-mingw32 \
--target=x86_64-w64-mingw32 --disable-multilib --prefix=$X_DISTRO_TEMP/gcc/dest --with-sysroot=$X_DISTRO_TEMP/gcc/dest

make $X_MAKE_JOBS all "CFLAGS=-O3" "LDFLAGS=-s"
make $X_MAKE_JOBS install
cd $X_DISTRO_TEMP/gcc
rm -rf build src
mv dest binutils-2.33.1
cd binutils-2.33.1
rm -rf lib/*.la share

7z -mx0 a ../binutils-2.33.1.7z *

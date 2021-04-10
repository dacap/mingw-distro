#!/bin/sh

source ./0_append_distro_path.sh

untar_file zstd-1.4.4.tar

cd $X_DISTRO_TEMP/gcc
mv zstd-1.4.4 src
mkdir build dest
cd build

cmake \
"-DCMAKE_C_FLAGS=-s -O3" \
"-DCMAKE_INSTALL_PREFIX=$X_DISTRO_TEMP/gcc/dest" \
"-DZSTD_BUILD_SHARED=OFF" \
-G "Unix Makefiles" $X_DISTRO_TEMP/gcc/src/build/cmake

make $X_MAKE_JOBS
make $X_MAKE_JOBS install
cd $X_DISTRO_TEMP/gcc
rm -rf build src
mv dest zstd-1.4.4
cd zstd-1.4.4
rm -rf bin/zstdgrep bin/zstdless lib/pkgconfig share
for i in bin/unzstd bin/zstdcat bin/zstdmt; do mv $i $i.exe; done

7z -mx0 a ../zstd-1.4.4.7z *

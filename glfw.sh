#!/bin/sh

source ./0_append_distro_path.sh

untar_file glfw-3.3.tar

cd $X_DISTRO_TEMP/gcc
mv glfw-3.3 src
mkdir build dest
cd build

cmake \
"-DCMAKE_C_FLAGS=-s -O3" \
"-DCMAKE_INSTALL_PREFIX=$X_DISTRO_TEMP/gcc/dest" \
"-DWIN32=ON" \
"-DGLFW_BUILD_DOCS=OFF" \
"-DGLFW_BUILD_EXAMPLES=OFF" \
"-DGLFW_BUILD_TESTS=OFF" \
-G "Unix Makefiles" $X_DISTRO_TEMP/gcc/src

make $X_MAKE_JOBS
make $X_MAKE_JOBS install
cd $X_DISTRO_TEMP/gcc
rm -rf build src
mv dest glfw-3.3
cd glfw-3.3
rm -rf lib/cmake lib/pkgconfig

7z -mx0 a ../glfw-3.3.7z *

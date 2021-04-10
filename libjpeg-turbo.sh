#!/bin/sh

source ./0_append_distro_path.sh

untar_file libjpeg-turbo-2.0.3.tar

cd $X_DISTRO_TEMP/gcc
mv libjpeg-turbo-2.0.3 src
mkdir build dest
cd build

cmake \
"-DCMAKE_ASM_NASM_FLAGS=-DWIN64" \
"-DCMAKE_ASM_NASM_OBJECT_FORMAT=win64" \
"-DCMAKE_C_FLAGS=-s -O3 -DTWO_FILE_COMMANDLINE" \
"-DCMAKE_INSTALL_PREFIX=$X_DISTRO_TEMP/gcc/dest" \
"-DENABLE_SHARED=OFF" \
-G "Unix Makefiles" $X_DISTRO_TEMP/gcc/src

make $X_MAKE_JOBS
make $X_MAKE_JOBS install
cd $X_DISTRO_TEMP/gcc
rm -rf build src
mv dest libjpeg-turbo-2.0.3
cd libjpeg-turbo-2.0.3
rm -rf bin/cjpeg.exe bin/djpeg.exe bin/rdjpgcom.exe bin/tjbench.exe bin/wrjpgcom.exe lib/pkgconfig share

7z -mx0 a ../libjpeg-turbo-2.0.3.7z *

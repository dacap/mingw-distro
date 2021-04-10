#!/bin/sh

source ./0_append_distro_path.sh

untar_file boost_1_71_0.tar

cd $X_DISTRO_TEMP/gcc
mv boost_1_71_0 src
mkdir -p dest/include
cd src

./bootstrap.sh

./b2 $X_B2_JOBS address-model=64 link=static runtime-link=static threading=multi variant=release \
--stagedir=$X_DISTRO_TEMP/gcc/dest stage

cd $X_DISTRO_TEMP/gcc/dest/lib
for i in *.a; do mv $i ${i%-mgw*.a}.a; done
cd $X_DISTRO_TEMP/gcc
mv src/boost dest/include
rm -rf src

mv dest boost-1.71.0
cd boost-1.71.0

7z -mx0 a ../boost-1.71.0.7z *

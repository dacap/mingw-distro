#!/bin/sh

source ./0_append_distro_path.sh

untar_file pngcheck-2.3.0.tar

cd $X_DISTRO_TEMP/gcc
mv pngcheck-2.3.0 src
mkdir -p dest/bin

gcc -s -O3 src/pngcheck.c -o dest/bin/pngcheck.exe
rm -rf src
mv dest pngcheck-2.3.0
cd pngcheck-2.3.0

7z -mx0 a ../pngcheck-2.3.0.7z *

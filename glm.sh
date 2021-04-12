#!/bin/sh

source ./0_append_distro_path.sh

untar_file glm-0.9.9.6.tar

cd $X_DISTRO_TEMP/gcc
mv glm-0.9.9.6 src
mkdir -p dest/include
mv src/glm dest/include
rm -rf src
mv dest glm-0.9.9.6
cd glm-0.9.9.6

7z -mx0 a ../glm-0.9.9.6.7z *

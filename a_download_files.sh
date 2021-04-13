#!/bin/sh

source ./0_append_distro_path.sh

function decompress_xz_file {
    xz -d $*
}

function decompress_bz2_file {
    bzip2 -d $*
}

mkdir files
cd files
curl https://ftp.gnu.org/gnu/binutils/binutils-2.33.1.tar.xz -o binutils-2.33.1.tar.xz
curl https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.bz2 -o file boost_1_71_0.tar.bz2
curl https://ftp.gnu.org/gnu/coreutils/coreutils-8.31.tar.xz -o coreutils-8.31.tar
curl https://download-mirror.savannah.gnu.org/releases/freetype/freetype-2.10.1.tar.xz -o freetype-2.10.1.tar.xz
curl https://ftp.gnu.org/gnu/gdb/gdb-8.3.1.tar.xz -o gdb-8.3.1.tar.xz

decompress_xz_file binutils-2.33.1.tar.xz
decompress_bz2_file boost_1_71_0.tar.bz2
decompress_xz_file coreutils-8.31.tar.xz
decompress_xz_file freetype-2.10.1.tar.xz

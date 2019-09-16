#!/bin/bash
set -e
set -x

cd ~/Documents

if [ ! -f ~/Documents/gcc-7.4.0.tar.gz ]; then
	wget http://ftp.gnu.org/gnu/gcc/gcc-7.4.0/gcc-7.4.0.tar.gz
fi

if [ ! -d ~/Documents/gcc-7.4.0 ]; then
	tar -zxvf gcc-7.4.0.tar.gz
fi

cd gcc-7.4.0

./contrib/download_prerequisites
sudo rm -r build
mkdir -p build
cd build
../configure -enable-checking=release -enable-languages=c,c++ -disable-multilib
make -j
sudo make install

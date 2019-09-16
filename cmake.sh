#!/bin/bash
set -e
set -x

sudo apt purge cmake


cd ~/Documents
if [ ! -f ~/Documents/cmake-3.15.3-Linux-x86_64.tar.gz ]; then
	wget https://github.com/Kitware/CMake/releases/download/v3.15.3/cmake-3.15.3-Linux-x86_64.tar.gz
fi
tar xvzf cmake-3.15.3-Linux-x86_64.tar.gz
cd cmake-3.15.3-Linux-x86_64
sudo cp -r bin /usr/
sudo cp -r share /usr/
sudo cp -r doc /usr/share/
sudo cp -r man /usr/share/
cd ..
rm -r cmake-3.15.3-Linux-x86_64
#rm -r cmake-3.15.3-Linux-x86_64.tar.gz

exit 1

cd ~/Documents
wget https://github.com/Kitware/CMake/releases/download/v3.15.3/cmake-3.15.3.tar.gz
tar xvzf cmake-3.15.3.tar.gz

cd cmake-3.15.3
./bootstrap.sh

make -j
sudo make install

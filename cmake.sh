#!/bin/bash
set -e
set -x

sudo apt remove cmake

cd ~/Documents
wget https://github.com/Kitware/CMake/releases/download/v3.15.3/cmake-3.15.3.tar.gz
tar xvzf cmake-3.15.3.tar.gz

cd cmake-3.15.3
./bootstrap.sh

make -j
sudo make install

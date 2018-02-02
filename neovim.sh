#!/bin/bash

set -x
set -e

sudo apt-get install -y libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

cd ~/Documents
rm -rf neovim
git clone https://github.com/neovim/neovim.git

cd neovim
git checkout v0.2.2
make CMAKE_BUILD_TYPE=Release -j2
sudo make install

sudo pip2 install neovim

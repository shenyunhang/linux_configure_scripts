#!/bin/bash

set -x
set -e

sudo apt-get install -y ctags python3-pip cmake pep8 libncurses5-dev libclang-dev clang-format latexmk curl

sudo -H pip3 install --upgrade pip
sudo -H pip3 install autopep8 jedi yapf

cd ~/
rm -rf vim
git clone https://github.com/vim/vim.git

cd vim
git checkout v8.2.0801

./configure --with-features=huge \
	--enable-python3interp \
	--with-python3-config-dir=$(python3-config --configdir) \
	--prefix=/usr/local 
make -j8
sudo make install

cd ~
sh <(curl -sSL https://raw.github.com/shenyunhang/vimrc/master/bootstrap.sh -L)

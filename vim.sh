#!/bin/bash

set -x
set -e

sudo apt-get install -y ctags python-pip cmake pep8 libncurses5-dev libclang-dev clang-format latexmk

sudo -H pip install --upgrade pip
sudo -H pip install autopep8 jedi yapf

cd ~/Documents
rm -rf vim
git clone https://github.com/vim/vim.git

cd vim
git checkout v8.0.1000

./configure --with-features=huge --enable-pythoninterp --prefix=/usr/local
make -j4
sudo make install

cd ~
sh <(curl -sSL https://raw.github.com/shenyunhang/vimrc/master/bootstrap.sh -L)

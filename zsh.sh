#!/bin/bash

set -x
set -e

# apt-get
# zsh
# curl
# git
sudo apt-get install -y zsh curl git

cd ~
sh <(curl https://raw.github.com/shenyunhang/zshrc/master/bootstrap.sh -L)

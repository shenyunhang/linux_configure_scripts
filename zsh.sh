#!/bin/bash

set -x
set -e

apt-get install -y zsh curl git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
exit 0

# apt-get
# zsh
# curl
# git
apt-get install -y zsh curl git

cd ~
sh <(curl https://raw.github.com/shenyunhang/zshrc/master/bootstrap.sh -L)

#!/bin/bash

set -x
set -e

# apt-get
# tmux
sudo apt-get install -y tmux

#echo "source "/usr/local/lib/python2.7/dist-packages/powerline/bindings/tmux/powerline.conf""> .tmux.conf

cd ~
rm -rf .tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
#echo "set -g mouse on" >> .tmux.conf.local


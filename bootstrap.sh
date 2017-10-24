#!/bin/bash
set -e
set -x

LOG=log.txt
exec &> >(tee -a "$LOG")

sudo apt-get install -y python-pip
pip install apt-select
apt-select -C CN -c -t 3 -m one-week-behind
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup && sudo mv sources.list /etc/apt/

# 添加仓库
./add_repository.sh

sudo apt-get update

sudo apt-get install -y $(grep -vE "^\s*#" package_list/apt-get | tr "\n" " ")

sudo pip install -r package_list/pip

sudo update-rc.d ssh defaults

./adjust_time.sh
#./glances.sh
./powerline.sh
./vim.sh
./tmux.sh
./caffe.sh
./zsh.sh

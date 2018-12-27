#!/bin/bash
set -e
set -x

LOG=log.txt
exec &> >(tee -a "$LOG")

# set system locale
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo dpkg-reconfigure locales

# change timezone
sudo timedatectl set-timezone Asia/Shanghai

#sudo apt-get install -y python-pip
#sudo pip install apt-select
#apt-select -C CN -c -t 3 -m one-week-behind
#sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup && sudo mv sources.list /etc/apt/

# 添加仓库
./add_repository.sh

sudo apt-get update
sudo apt-get install -y $(grep -vE "^\s*#" package_list/apt-get | tr "\r\n" " ")

sudo pip install pip --upgrade
sudo pip --no-cache-dir install -r package_list/pip

sudo update-rc.d ssh defaults

./adjust_time.sh
#./glances.sh
./powerline.sh
./vim.sh
./tmux.sh
#./caffe.sh
./zsh.sh

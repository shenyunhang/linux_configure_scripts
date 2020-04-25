#/bin/bash

set -e
set -x

#####################################################################
#####################################################################
# This script will install pytorch and caffe2 from source.
#####################################################################
#####################################################################

alias python='/usr/bin/python3.6'
alias pip='/usr/local/bin/pip3.6'

cd ~/Documents
mkdir -p pytorch

echo "Installing pytorch"
cd ~/Documents/pytorch
if [ ! -d ~/Documents/pytorch/pytorch ]; then
	git clone https://github.com/pytorch/pytorch.git
	cd pytorch
else
	cd pytorch
	git fetch origin

fi
sudo rm -rf build
rm -r ./*
sudo git reset --hard HEAD
git checkout v1.5.0

sudo pip install -r requirements.txt
sudo pip install -r caffe2/requirements.txt
sudo pip install protobuf

git submodule sync
git submodule update --init --recursive
sudo MAX_JOBS=4 USE_OPENCV=On USE_LMDB=On BUILD_BINARY=On python setup.py install


echo "Installing vision"
cd ~/Documents/pytorch
if [ ! -d ~/Documents/pytorch/vision ]; then
	git clone https://github.com/pytorch/vision.git
	cd vision
else
	cd vision
	git fetch origin
fi
#git checkout v0.5.0
git checkout origin/master

git submodule sync
git submodule update --init --recursive
sudo rm -rf build
sudo MAX_JOBS=4 python setup.py install


echo "Installing examples"
cd ~/Documents/pytorch
if [ ! -d ~/Documents/pytorch/examples ]; then
	git clone https://github.com/pytorch/examples.git
fi

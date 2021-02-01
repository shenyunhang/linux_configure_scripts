#/bin/bash

set -e
set -x

echo "#####################################################################"
echo "#####################################################################"
echo "# This script will install pytorch and caffe2 from source."
echo "#####################################################################"
echo "#####################################################################"

sudo apt-get install -y --no-install-recommends \
	libleveldb-dev \
	liblmdb-dev \
	libopencv-dev \

#alias python='/usr/bin/python3.8'
#alias pip='/usr/local/bin/pip3.8'
PYTHON='/usr/bin/python3.8'
PIP='/usr/local/bin/pip3.8'

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

git checkout v1.6.0

sudo rm -rf build
sudo rm -r ./*
git reset --hard HEAD

sudo $PIP install -r requirements.txt
sudo $PIP install -r caffe2/requirements.txt
sudo $PIP install protobuf

git submodule sync
git submodule update --init --recursive
sudo MAX_JOBS=32 USE_OPENCV=On USE_LMDB=On BUILD_BINARY=On $PYTHON setup.py install


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

sudo rm -rf build
sudo rm -r ./*
git reset --hard HEAD

git submodule sync
git submodule update --init --recursive

sudo MAX_JOBS=4 $PYTHON setup.py install


echo "Installing examples"
cd ~/Documents/pytorch
if [ ! -d ~/Documents/pytorch/examples ]; then
	git clone https://github.com/pytorch/examples.git
fi

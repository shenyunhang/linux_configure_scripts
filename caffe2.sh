#!/bin/bash
set -e
set -x

# Opencv
if [ ! -d ~/Documents/opencv  ]; then
	echo "we need install opencv to build caffe"
	./opencv.sh
fi

# Caffe2
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
	build-essential \
	cmake \
	git \
	libgoogle-glog-dev \
	libgtest-dev \
	libiomp-dev \
	libleveldb-dev \
	liblmdb-dev \
	#libopencv-dev \
	libopenmpi-dev \
	libsnappy-dev \
	libprotobuf-dev \
	openmpi-bin \
	openmpi-doc \
	protobuf-compiler \
	python-dev \
	python-pip                          
sudo pip install \
	future \
	numpy \
	protobuf

# for Ubuntu 14.04
#sudo apt-get install -y --no-install-recommends libgflags2
# for Ubuntu 16.04
sudo apt-get install -y --no-install-recommends libgflags-dev


cd ~/Documents
rm -rf caffe2
git clone --recursive https://github.com/caffe2/caffe2.git
cd caffe2
make && cd build && sudo make install

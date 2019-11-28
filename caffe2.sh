#!/bin/bash
set -e
set -x

#####################################################################
#####################################################################
# This script is Deprecated.
# Using pytorch.sh instead.
#####################################################################
#####################################################################


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
mkdir -p build
cd build
cmake `python ../scripts/get_python_cmake_flags.py` -DCMAKE_INSTALL_PREFIX=~/Documents/caffe2/release ..
make -j2
make install

python -c "from caffe2.python import core" 2>/dev/null && echo "Success" || echo "Failure"
python -m caffe2.python.operator_test.relu_op_test

echo "export LD_LIBRARY_PATH=~/Documents/caffe2/release/lib:$LD_LIBRARY_PATH"
echo "export PYTHONPATH=~/Documents/caffe2/release:$PYTHONPATH"
echo "export PYTHONPATH=~/Documents/caffe2/build:$PYTHONPATH"


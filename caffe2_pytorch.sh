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
sudo apt-get install -y --no-install-recommends \
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
rm -rf pytorch
git clone https://github.com/pytorch/pytorch.git
cd pytorch
git checkout v1.0.1 
git submodule update --init --recursive
mkdir -p build
cd build
cmake `python ../scripts/get_python_cmake_flags.py` ..
make -j16
sudo make install -j16

python -c "from caffe2.python import core" 2>/dev/null && echo "Success" || echo "Failure"
python -m caffe2.python.operator_test.relu_op_test

echo "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH"
echo "export PYTHONPATH=/usr/local/lib/python2.7/site-packages/:$PYTHONPATH"

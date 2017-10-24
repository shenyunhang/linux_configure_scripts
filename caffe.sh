#!/bin/bash
set -e
set -x

sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler

sudo apt-get install -y --no-install-recommends libboost-all-dev

sudo apt-get install -y libatlas-base-dev
#or
sudo apt-get install -y libopenblas-dev

sudo apt-get install -y python-dev

sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev

# Opencv
echo "we need install opencv to build caffe"
sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install -y liblapacke-dev checkinstall

cd ~/Documents
rm -rf opencv
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.2.0
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF ..
make -j4
#cd doc
#make -j4 html-docs
#cd ..
sudo make install
#exit

# Caffe
cd ~/Documents
rm -rf caffe
git clone https://github.com/BVLC/caffe.git
cd caffe

for req in $(cat python/requirements.txt); do sudo -H pip install $req; done

cp Makefile.config.example Makefile.config
echo "You Need Adjust Makefile.config"
echo "Then:"
echo "make all"
echo "make test"
echo "make runtest"

# Adjust Makefile.config (for example, if using Anaconda Python, or if cuDNN is desired)
# make all
# make test
# make runtest


#!/bin/bash
set -e
set -x

sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
#sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
sudo apt-get install -y liblapacke-dev checkinstall

cd ~/Documents
#rm -rf opencv
#rm -rf opencv_contrib

if [ ! -d ~/Documents/opencv ]; then
	git clone https://github.com/opencv/opencv.git
fi

if [ ! -d ~/Documents/opencv_contrib ]; then
	git clone https://github.com/opencv/opencv_contrib.git
fi

cd opencv_contrib
git checkout 3.3.0
cd ..

cd opencv
git checkout 3.3.0

rm -fr build
mkdir -p build
cd build
#cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF ..
#cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF -D WITH_OPENCL=OFF ..
#cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF -D WITH_OPENCL=OFF -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=OFF -D WITH_OPENCL=OFF ..
make -j
#cd doc
#make -j html-docs
#cd ..
sudo make install
#exit

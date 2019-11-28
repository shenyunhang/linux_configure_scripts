#/bin/bash

set -e
set -x

#####################################################################
#####################################################################
# This script will install pytorch and caffe2 from source.
#####################################################################
#####################################################################

cd ~/Documents
mkdir -p pytorch

echo "Installing pytorch"
cd ~/Documents/pytorch
if [ ! -d ~/Documents/pytorch/pytorch ]; then
	git clone https://github.com/pytorch/pytorch.git
fi
cd pytorch
git checkout v1.3.1

sudo pip3 install -r requirements.txt
sudo pip3 install -r caffe2/requirements.txt
sudo pip3 install protobuf

git submodule sync
git submodule update --init --recursive
sudo rm -rf build
sudo MAX_JOBS=4 USE_OPENCV=On USE_LMDB=On BUILD_BINARY=On python3 setup.py install


echo "Installing vision"
cd ~/Documents/pytorch
if [ ! -d ~/Documents/pytorch/vision ]; then
	git clone https://github.com/pytorch/vision.git
fi
cd vision
git checkout v0.4.1

git submodule sync
git submodule update --init --recursive
sudo python3 setup.py install


echo "Installing examples"
cd ~/Documents/pytorch
if [ ! -d ~/Documents/pytorch/examples ]; then
	git clone https://github.com/pytorch/examples.git
fi

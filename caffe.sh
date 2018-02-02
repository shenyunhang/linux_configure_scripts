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
if [ ! -d ~/Documents/opencv  ]; then
	echo "we need install opencv to build caffe"
	./opencv.sh
fi

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


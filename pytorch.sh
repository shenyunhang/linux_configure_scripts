#/bin/bash

set -e
set -x

cd ~/Documents
mkdir -p pytorch

if [ ! -d ~/Documents/pytorch/pytorch ]; then
	echo "we need install pytorch"

	cd ~/Documents/pytorch
	git clone https://github.com/pytorch/pytorch.git
	cd pytorch
	git checkout v1.2.0

	sudo pip3 install -r requirements.txt

	git submodule sync
	git submodule update --init --recursive
	sudo USE_OPENCV=On USE_LMDB=On BUILD_BINARY=On python3 setup.py install
fi

if [ ! -d ~/Documents/pytorch/vision ]; then
	echo "we need install vision"

	cd ~/Documents/pytorch
	git clone https://github.com/pytorch/vision.git
	cd vision
	git checkout v0.4.0

	git submodule sync
	git submodule update --init --recursive
	sudo python3 setup.py install
fi

if [ ! -d ~/Documents/pytorch/examples ]; then
	echo "we need install examples"
	cd ~/Documents/pytorch
	git clone https://github.com/pytorch/examples.git
fi

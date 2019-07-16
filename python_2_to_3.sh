#/bin/bash

set -e
set -x

sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 20
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 30

sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip2 20
sudo update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 30

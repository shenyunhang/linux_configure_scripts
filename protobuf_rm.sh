#/bin/bash

set -e
set -x

sudo apt-get remove libprotobuf-dev
sudo apt-get remove protobuf-compiler
sudo apt-get remove python-protobuf
sudo rm -rf /usr/local/bin/protoc
sudo rm -rf /usr/bin/protoc
sudo rm -rf /usr/local/include/google
sudo rm -rf /usr/local/include/protobuf*
sudo rm -rf /usr/include/google
sudo rm -rf /usr/include/protobuf*

#以下三行慎用！
sudo rm -rf /usr/local/lib/libproto*
sudo rm -rf /usr/lib/libproto*
sudo rm -rf /usr/lib/x86_64-linux-gnu/libproto*

#sudo apt-get update
#sudo ldconfig
#sudo apt-get install libprotobuf* protobuf-compiler python-protobuf

#!/bin/bash

set -x
set -e

cd ~/Documents
rm -r nccl
git clone https://github.com/NVIDIA/nccl.git

cd nccl
make CUDA_HOME=/usr/local/cuda test
sudo make PREFIX=/usr/local install

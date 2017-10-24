#!/bin/bash
set -e
set -x

sudo apt-get install -y default-jre-headless gvfs-bin python-notify

cd /tmp
wget http://www.jianguoyun.com/static/exe/installer/nutstore_linux_dist_x64.tar.gz -O /tmp/nutstore_bin.tar.gz
mkdir -p ~/.nutstore/dist && tar zxf /tmp/nutstore_bin.tar.gz -C ~/.nutstore/dist
~/.nutstore/dist/bin/install_core.sh

#!/bin/bash
set -e
set -x

mkdir -p ~/Downloads
cd ~/Downloads

wget http://kdl.cc.ksosoft.com/wps-community/download/8392/wps-office_11.1.0.8392_amd64.deb
sudo dpkg -i wps-office_11.1.0.8392_amd64.deb
sudo apt install -f

# install font
cd /tmp
git clone https://github.com/iamdh4/ttf-wps-fonts.git
cd ttf-wps-fonts
sudo bash install.sh
rm -rf /tmp/ttf-wps-fonts

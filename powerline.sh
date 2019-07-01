#!/bin/bash

set -x
set -e

sudo -H pip install powerline-status

#wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
#wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
cd /tmp
git clone https://github.com/powerline/powerline.git

mkdir -p ~/.fonts/
cp /tmp/powerline/font/PowerlineSymbols.otf ~/.fonts/
#sudo mv PowerlineSymbols.otf /usr/share/fonts/X11/misc

fc-cache -vf ~/.fonts/
#sudo fc-cache -vf /usr/share/fonts/X11/misc

mkdir -p ~/.config/fontconfig/conf.d/
cp /tmp/powerline/font/10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

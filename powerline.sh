#!/bin/bash

set -x
set -e

sudo -H pip install powerline-status

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mkdir -p ~/.fonts/
mv PowerlineSymbols.otf ~/.fonts/
#sudo mv PowerlineSymbols.otf /usr/share/fonts/X11/misc

fc-cache -vf ~/.fonts/
#sudo fc-cache -vf /usr/share/fonts/X11/misc

mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

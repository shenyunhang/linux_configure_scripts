#!/bin/bash
set -e
set -x

# Install dependencies
sudo apt-get install git python-appindicator python-xdg python-pexpect python-gconf python-gtk2 python-glade2 libxxf86vm1

# Download fluxgui
cd /tmp
git clone "https://github.com/xflux-gui/fluxgui.git"
cd fluxgui
python download-xflux.py

# EITHER install globally
sudo python setup.py install

# EXCLUSIVE OR, install in your home directory. The binary installs
# into ~/.local/bin, so be sure to add that to your PATH if installing
# locally. In particular, autostarting fluxgui in Gnome will not work
# if the locally installed fluxgui is not on your PATH.
python setup.py install --user
       
# Run flux
fluxgui

#!/bin/bash
set -e
set -x

sudo add-apt-repository ppa:kubuntu-ppa/backports

sudo apt-get update

sudo apt-get install -y kubuntu-desktop

#sudo apt purge kubuntu-desktop
#sudo apt autoremove
#sudo add-apt-repository –remove ppa:kubuntu-ppa/backports

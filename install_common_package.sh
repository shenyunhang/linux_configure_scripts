#!/bin/bash
set -e
set -x

apt-get update
apt-get install -y $(grep -vE "^\s*#" package_list/apt-get  | tr "\n" " ")

pip3 install -r package_list/pip

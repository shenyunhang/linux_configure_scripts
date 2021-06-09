#!/bin/bash
set -e
set -x

apt-get install $(grep -vE "^\s*#" package_list/apt-get  | tr "\n" " ")

pip3 install -r package_list/pip

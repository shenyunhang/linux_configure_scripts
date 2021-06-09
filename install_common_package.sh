#!/bin/bash
set -e
set -x

apt-get install $(grep -vE "^\s*#" package/apt-get  | tr "\n" " ")

pip3 install -r package/pip

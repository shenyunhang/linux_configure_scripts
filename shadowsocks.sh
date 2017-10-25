#!/bin/bash

set -x
set -e

wget –no-check-certificate https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh -O /tmp/shadowsocks.sh
chmod +x /tmp/shadowsocks.sh
sudo /tmp/shadowsocks.sh

echo "You should ppen socks of TCP for shadowsocks"

#!/bin/bash

#windows10和ubuntu16.04双系统下时间不对的问题

set -x
set -e

sudo apt-get install ntpdate
sudo ntpdate pool.ntp.org
sudo hwclock --localtime --systohc

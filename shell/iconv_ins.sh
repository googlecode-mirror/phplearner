#!/bin/bash
# libiconv install scripts
# Author:wdlinux
# Url http://www.wdlinux.cn
cd /tmp
wget -c http://dl.wdlinux.cn:5180/soft/libiconv-1.14.tar.gz
tar zxvf libiconv-1.14.tar.gz
cd libiconv-1.14
./configure --prefix=/usr
make
[ $? != 0 ] && exit
make install
ldconfig
echo
echo "install is OK"

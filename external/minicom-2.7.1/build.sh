#########################################################################
# File Name     : build.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2021年02月23日 星期二 21时08分17秒
#########################################################################

#!/bin/bash
GCC='arm-linux-gnueabihf'
OUT='/home/zhaosonz/workspace/imx6ulll-vics/external/minicom'
LIB='/home/zhaosonz/workspace/imx6ulll-vics/external/ncurses'
./configure CC=$GCC-gcc --prefix=$OUT --host=$GCC CPPFLAGS=-I$LIB/include LDFLAGS=-L$LIB/lib -enable-cfgdir=/etc/minicom

make 

make install

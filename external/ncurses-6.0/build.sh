#########################################################################
# File Name     : build.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2021年02月23日 星期二 21时08分17秒
#########################################################################

#!/bin/bash
CC='arm-linux-gnueabihf'
OUT='/home/zhaosonz/workspace/imx6ulll-vics/external/ncurses'

./configure --prefix=$OUT --host=$CC --target=$CC --with-shared --without-profile --disable-stripping --without-progs --with-manpages --without-test

make

make install

#########################################################################
# File Name     : build.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2020年12月09日 星期三 23时47分49秒
#########################################################################

#!/bin/bash
PASSWORD='123456'

if [ "$1" = "defconfig" ];then
	make defconfig
elif [ "$1" = "make" ];then
	echo "123456" | sudo -S make imx6ull_alientek_defconfig
	echo "123456" | sudo -S make
else
	echo "./build.sh defconfig       -- make defconfig..."
	echo "./build.sh make            -- make..."
fi

#########################################################################
# File Name     : build.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2020年12月09日 星期三 23时47分49秒
#########################################################################

#!/bin/bash
PASSWORD='123456'

function help(){
	# echo "$0 menuconfig      -- make defconfig..."
	echo "$0 emmc            -- sudo make(config is imx6ull_alientek_defconfig)..."
}

if [ "$1" = "emmc" ];then
	echo "$PASSWORD" | sudo -S make imx6ull_alientek_defconfig
	echo "$PASSWORD" | sudo -S make
	echo -e "buildroot build done!"
	cp output/images/rootfs.tar.bz2 ../../out/Image/rootfs-alientek-emmc.tar.bz2
	echo -e "copy rootfs done!"
else
	help
fi

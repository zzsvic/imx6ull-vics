#########################################################################
# File Name     : build.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2021年02月01日 星期一 23时14分20秒
#########################################################################

#!/bin/bash
workdir=$(cd $(dirname $0); pwd)
echo "$workdir"

if [ "$1" = "clean" ];then
	cd $workdir/uboot-2016.03
	./build.sh clean

	cd $workdir/linux-imx-4.1.15
	./build.sh clean
	cd $workdir/rootfs/buildroot-2020.02.8
	./build.sh clean
	
	cd $workdir/rootfs/busybox-1.32.0
	./build.sh clean
	echo -e "clean done!!!"

elif [ "$1" = "uboot" ];then
	cd $workdir/uboot-2016.03
	./build.sh emmc
	echo -e "build uboot done!!!"

elif [ "$1" = "uboot nand" ];then
	cd $workdir/uboot-2016.03
	./build.sh nand
	echo -e "build uboot nand done!!!"

elif [ "$1" = "linux" ];then
	cd $workdir/linux-imx-4.1.15
	./build.sh emmc
	echo -e "build linux done!!!"

elif [ "$1" = "linux nand" ];then
	cd $workdir/linux-imx-4.1.15
	./build.sh nand
	echo -e "build linux nand done!!!"

elif [ "$1" = "dts" ];then
	cd $workdir/linux-imx-4.1.15
	./build.sh edts
	echo -e "build linux  done!!!"

elif [ "$1" = "nand dts" ];then
	cd $workdir/linux-imx-4.1.15
	./build.sh ndts
	echo -e "build linux  done!!!"

elif [ "$1" = "modules" ];then
	cd $workdir/linux-imx-4.1.15
	./build.sh emmc modules
	echo -e "build linux  done!!!"

elif [ "$1" = "nand modules" ];then
	cd $workdir/linux-imx-4.1.15
	./build.sh nand modules
	echo -e "build linux  done!!!"

elif [ "$1" = "buildroot" ];then
	cd $workdir/rootfs/buildroot-2020.02.8
	./build.sh make
	echo -e "build bulidroot done!!!"

elif [ "$1" = "busybox" ];then
	cd $workdir/rootfs/busybox-1.32.0
	./build.sh 
	echo -e "build busybox done!!!"

elif [ "$1" = "emmc" ];then
	cd $workdir/uboot-2016.03
	./build.sh emmc
	cd $workdir/linux-imx-4.1.15
	./build.sh emmc
	cd $workdir/linux-imx-4.1.15
	./build.sh emmc modules
	cd $workdir/rootfs/buildroot-2020.02.8
	./build.sh make
	echo -e "bulid emmc buildroot done!!!"

elif [ "$1" = "nand" ];then
	cd $workdir/uboot-2016.03
	./build.sh nand
	cd $workdir/linux-imx-4.1.15
	./build.sh nand
	cd $workdir/linux-imx-4.1.15
	./build.sh nand modules
	cd $workdir/rootfs/buildroot-2020.02.8
	./build.sh make
	echo -e "bulid nand buildroot done!!!"

elif [ "$1" = "emmc" ];then
	cd $workdir/uboot-2016.03
	./build.sh emmc
	cd $workdir/linux-imx-4.1.15
	./build.sh emmc
	cd $workdir/linux-imx-4.1.15
	./build.sh emmc modules
	cd $workdir/rootfs/busybox-1.32.0
	./build.sh 
	echo -e "bulid emmc busybox done!!!"

elif [ "$1" = "nand" ];then
	cd $workdir/uboot-2016.03
	./build.sh nand
	cd $workdir/linux-imx-4.1.15
	./build.sh nand
	cd $workdir/linux-imx-4.1.15
	./build.sh nand modules
	cd $workdir/rootfs/busybox-1.32.0
	./build.sh 
	echo -e "bulid nand busybox done!!!"

else
	echo "./build.sh clean          -- clean..."
	echo "./build.sh uboot          -- build uboot emmc..."
	echo "./build.sh uboot nand     -- build uboot nand..."
	echo "./build.sh linux          -- build linux kernel emmc..."
	echo "./build.sh linux nand     -- build linux kernel nand..."
	echo "./build.sh dts            -- build linux emmc dts..."
	echo "./build.sh nand dts       -- build linux nand dts..."
	echo "./build.sh module         -- build linux emmc module..."
	echo "./build.sh nand module    -- build linux nand module..."
	echo "./build.sh busybox        -- build busybox rootfd..."
	echo "./build.sh buildroot      -- build buildroot rootfs..."
	echo "./build.sh emmc           -- build uboot linux buildroot..."
	echo "./build.sh nand           -- build uboot linux buildroot..."
	echo "./build.sh emmc busybox   -- build uboot linux buildroot..."
	echo "./build.sh nand busybox   -- build uboot linux buildroot..."
fi

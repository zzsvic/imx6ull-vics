#########################################################################
# File Name     : build.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2021年02月01日 星期一 23时14分20秒
#########################################################################

#!/bin/bash
workdir=$(cd $(dirname $0); pwd)
echo "$workdir"
COPY_OPT="/mnt/hgfs/linuxShare/I.MX6ULL/Image/"

if [ "$1" = "emmc" ];then
	if [ "$2" = "clean" ];then
		cd $workdir/uboot-2016.03
		./build.sh clean
		cd $workdir/linux-imx-4.1.15
		./build.sh clean
		cd $workdir/rootfs/buildroot-2020.02.8
		./build.sh clean
		cd $workdir/rootfs/busybox-1.32.0
		./build.sh clean
		echo -e "clean done!!!"
	elif [ "$2" = "uboot" ];then
		cd $workdir/uboot-2016.03
		./build.sh emmc
		echo -e "build emmc uboot done!!!"
	elif [ "$2" = "linux" ];then
		cd $workdir/linux-imx-4.1.15
		./build.sh emmc
		echo -e "build emmc linux done!!!"
	elif [ "$2" = "dtbs" ];then
		cd $workdir/linux-imx-4.1.15
		./build.sh emmc dtbs
		echo -e "build emmc linux dtb done!!!"
	elif [ "$2" = "modules" ];then
		cd $workdir/linux-imx-4.1.15
		./build.sh emmc modules
		echo -e "build emmc linux modules done!!!"
	elif [ "$2" = "buildroot" ];then
		cd $workdir/rootfs/buildroot-2020.02.8
		./build.sh make
		echo -e "build emmc bulidroot done!!!"
	elif [ "$2" = "busybox" ];then
		cd $workdir/rootfs/busybox-1.32.0
		./build.sh 
		echo -e "build emmc busybox done!!!"
	else
		cd $workdir/uboot-2016.03
		./build.sh emmc
		cd $workdir/linux-imx-4.1.15
		./build.sh emmc
		cd $workdir/linux-imx-4.1.15
		./build.sh emmc modules
		cd $workdir/rootfs/buildroot-2020.02.8
		./build.sh make
		echo -e "bulid emmc buildroot system done!!!"
	fi

elif [ "$1" = "nand" ];then
	if [ "$2" = "clean" ];then
		cd $workdir/uboot-2016.03
		./build.sh clean
		cd $workdir/linux-imx-4.1.15
		./build.sh clean
		cd $workdir/rootfs/buildroot-2020.02.8
		./build.sh clean
		cd $workdir/rootfs/busybox-1.32.0
		./build.sh clean
		echo -e "clean done!!!"
	
	elif [ "$2" = "uboot" ];then
		cd $workdir/uboot-2016.03
		./build.sh nand
		echo -e "build nand uboot done!!!"
	elif [ "$2" = "linux" ];then
		cd $workdir/linux-imx-4.1.15
		./build.sh nand
		echo -e "build nand linux done!!!"
	elif [ "$2" = "dts" ];then
		cd $workdir/linux-imx-4.1.15
		./build.sh nand dtbs
		echo -e "build nand linux dtb done!!!"
	elif [ "$2" = "modules" ];then
		cd $workdir/linux-imx-4.1.15
		./build.sh nand modules
		echo -e "build nand linux modules done!!!"
	elif [ "$2" = "buildroot" ];then
		cd $workdir/rootfs/buildroot-2020.02.8
		./build.sh make
		echo -e "build nand bulidroot done!!!"
	elif [ "$2" = "busybox" ];then
		cd $workdir/rootfs/busybox-1.32.0
		./build.sh 
		echo -e "build nand busybox done!!!"
	else
		cd $workdir/uboot-2016.03
		./build.sh nand
		cd $workdir/linux-imx-4.1.15
		./build.sh nand
		cd $workdir/linux-imx-4.1.15
		./build.sh nand modules
		cd $workdir/rootfs/buildroot-2020.02.8
		./build.sh make
		echo -e "bulid nand buildroot system done!!!"
	fi

else
	echo "Select execute from the following command:"
	echo "    ./build.sh emmc clean     -- clean..."
	echo "    ./build.sh emmc uboot     -- build emmc uboot..."
	echo "    ./build.sh emmc linux     -- build emmc linux..."
	echo "    ./build.sh emmc dtbs       -- build emmc device-tree..."
	echo "    ./build.sh emmc modules   -- build emmc driver modules..."
	echo "    ./build.sh emmc buildroot -- build emmc driver buildroot..."
	echo "    ./build.sh emmc busybox   -- build emmc driver busybox..."
	echo "    ./build.sh emmc           -- build emmc uboot linux modules dtbs rootfs(buildroot)..."
	
	echo "    ./build.sh nand clean     -- clean..."
	echo "    ./build.sh nand uboot     -- build nand uboot..."
	echo "    ./build.sh nand linux     -- build nand linux..."
	echo "    ./build.sh nand dtbs       -- build nand device-tree..."
	echo "    ./build.sh nand modules   -- build nand driver modules..."
	echo "    ./build.sh nand buildroot -- build nand driver buildroot..."
	echo "    ./build.sh nand busybox   -- build nand driver busybox..."
	echo "    ./build.sh nand           -- build nand uboot linux modules dtbs rootfs(buildroot)..."
fi

cd $workdir
cp out/Image/*emmc* $COPY_OPT

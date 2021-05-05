#########################################################################
# File Name     : build.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2020年09月13日 星期日 18时00分40秒
#########################################################################

#!/bin/bash
# make defconfig
PLATFORM='ARM'
COMPILE='arm-linux-gnueabihf-'

OBJ='/home/zhaosonz/workspace/alientek-imx6ull/rootfs'
CLIB='/home/zhaosonz/workspace/alientek-imx6ull/rootfs/lib'
USR_LIB='/home/zhaosonz/workspace/alientek-imx6ull/rootfs/usr/lib'
GCC_LIB='/home/zhaosonz/software/gcc-linaro-arm-linux-gnueabihf/arm-linux-gnueabihf/libc/lib/'
GCC_U_LIB='/home/zhaosonz/software/gcc-linaro-arm-linux-gnueabihf/arm-linux-gnueabihf/libc/usr/lib/'

if [ "$1" = "clean" ];then
	make ARCH=$PLATFORM CROSS_COMPILE=$COMPILE clean
	make ARCH=$PLATFORM CROSS_COMPILE=$COMPILE distclean
	exit 0
elif [ "$1" = "menuconfig" ];then
	echo "配置busyBox..."
	cp .imx6ull-alientek-mini-config .config
	make ARCH=$PLATFORM CROSS_COMPILE=$COMPILE menuconfig
	cp .config .imx6ull-alientek-mini-config

elif [ "$1" = "defconfig" ];then
	echo "缺省配置..."
	cp .imx6ull-alientek-mini-config .config
	make ARCH=$PLATFORM CROSS_COMPILE=$COMPILE defconfig

elif [ "$1" = "allnoconfig" ];then
	echo "最小配置..."
	make ARCH=$PLATFORM CROSS_COMPILE=$COMPILE allnoconfig

elif [ "$1" = "allyesconfig" ];then
	echo "全选配置..."
	make ARCH=$PLATFORM CROSS_COMPILE=$COMPILE allyesconfig
else
	echo "./build.sh menuconfig        --"
	echo "./build.sh defconfig         -- 默认配置"
	echo "./build.sh allnoconfig       -- 最小配置"
	echo "./build.sh allyesconfig      -- 全选配置"
	echo "./build.sh clean             -- clean..."
	exit 0
fi

echo "================================================================================"
echo "                                  build busybox                                 "
echo "================================================================================"
if [ ! -d "$OBJ" ];then
	echo "mkdir -p $OBJ"
	mkdir -p $OBJ
fi
make ARCH=$PLATFORM CROSS_COMPILE=$COMPILE 
make ARCH=$PLATFORM CROSS_COMPILE=$COMPILE install CONFIG_PREFIX=$OBJ

echo "================================================================================"
echo "                                   添加lib库                                "
echo "================================================================================"
if [ ! -d "$CLIB" ];then
	echo "mkdir -p $CLIB"
	mkdir -p $CLIB
fi
echo "copy *.so* *.a"

cd $GCC_LIB
cp *.so* *.a $CLIB -d
rm $CLIB/ld-linux-armhf.so.3
cp ld-linux-armhf.so.3 $CLIB -d

cd ~/software/gcc-linaro-arm-linux-gnueabihf/arm-linux-gnueabihf/lib
cp *.so* *.a $CLIB/ -d

echo "================================================================================"
echo "                                  添加usr/lib库                                 "
echo "================================================================================"
if [ ! -d "$USR_LIB" ];then
	echo "mkdir -p rootfs/usr/lib"
	CUR_PWD=pwd
    echo "cd $CUR_PWD"
	cd ~/workspace/nfs/rootfs/
	mkdir -p usr/lib
	cd=$CUR_PWD
fi
echo "copy *.so* *.a"
cd $GCC_U_LIB
cp *.so* *.a $USR_LIB/ -d


echo "================================================================================"
echo "                             lib and /usr.lib size                              "
echo "================================================================================"
CUR_PWD=`pwd`

cd $CLIB/../
du ./lib ./usr/lib -sh

echo "-------------------------------------------------------------------------------"
echo "================================================================================"
echo "                                mkdir other dir.                                "
echo "================================================================================"
if [ ! -d "dev" ]; then
	mdkir dev
elif [ ! -d "proc" ];then
	mdkir proc
elif [ ! -d "mnt" ];then
	mdkir mnt
elif [ ! -d "sys" ];then
	mdkir sys
elif [ ! -d "tmp" ];then
	mdkir tmp
elif [ ! -d "root" ];then
	mdkir root
elif [ ! -d "home" ];then
	mdkir home
elif [ ! -d "etc" ];then
	mdkir etc
fi
echo "-------------------------------------------------------------------------------"

echo "cd $CUR_PWD"
cd $CUR_PATH


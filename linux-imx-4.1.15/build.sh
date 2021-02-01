# !/bash/sh

GCC="arm-linux-gnueabihf-"
MAKE_CLEAN='clean'
BUILD_EMMC='emmc'
BUILD_NAND='nand'
BUILD_DTS='dts'
PUSH_MASTER='master'
PUSH_DEVELOP='develop'
PUSH_RELEASE='release'
MAKE_MENUCFG='menuconfig'

# echo $1 $BUILD_DTS
if [ "$1" = "$MAKE_CLEAN" ];then
	echo -e "\n============================================"
	echo -e "make clean...\n"
	make ARCH=arm CROSS_COMPILE=$GCC distclean
	make ARCH=arm CROSS_COMPILE=$GCC clean

elif [ "$1" = "$MAKE_MENUCFG" ];then
	echo -e "\n============================================"
	echo -e "make menuconfig...\n"
	make ARCH=arm CROSS_COMPILE=$GCC menuconfig


elif [ "$1" = "$BUILD_NAND" ];then
	echo -e "请期待..."

elif [ "$1" = "$BUILD_EMMC" ];then
	echo -e "\n============================================"
	echo -e "export imx_alientek_emmc_defconfig...\n\n"
	make ARCH=arm CROSS_COMPILE=$GCC imx_alientek_emmc_defconfig
	echo -e "\n============================================"
	echo -e "make menuconfig..\n\n"
	make ARCH=arm CROSS_COMPILE=$GCC menuconfig 
	echo -e "\n============================================"
	echo -e "make all -j4...\n\n"
	make ARCH=arm CROSS_COMPILE=$GCC all -j6 

elif [ "$1" = "$BUILD_DTS" ];then
	echo -e "============================================"
	echo -e "build imx6ull-alientek.dts...\n\n"
	make ARCH=arm CROSS_COMPILE=$GCC dtbs -j6


elif [ "$1" = "$PUSH_MASTER" ];then
	git pull
	git push origin master

elif [ "$1" = "$PUSH_DEVELOP" ];then
	git pull
	git push origin develop

elif [ "$1" = "$PUSH_RELEASE" ];then
	git pull
	git push origin release

else
	echo "Select execute from the following command:"
	echo "    ./build.sh distclean      -- distclean project"
	echo "    ./build.sh clean          -- clean project"
	echo "    ./build.sh menuconfig     -- make menuconfig"
	echo "    ./build.sh emmc           -- Compile the EMMC version of Linux kernel"
	echo -e "    ./build.sh nand           -- Compile the nand version of Linux kernel"
	echo "    ./build.sh dts            -- make dts"
	
	echo "    ./build.sh master         -- push github master"
	echo "    ./build.sh develop        -- push github develop"
	echo "    ./build.sh release        -- push github release"
fi



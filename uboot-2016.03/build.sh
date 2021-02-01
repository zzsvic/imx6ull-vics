# !/bash/sh

GCC="arm-linux-gnueabihf-"
MAKE_CLEAN='clean'
MAKE_DISTC='distclean'
BUILD_EMMC='emmc'
BUILD_NAND='nand'
PUSH_MASTER='master'
PUSH_DEVELOP="develop"
PUSH_RELEASE="release"


if [ "$1" = "$MAKE_DISTC" ];then
	echo -e "\n============================================"
	echo -e "make distclean...\n"
	make ARCH=arm CROSS_COMPILE=$GCC distclean

elif [ "$1" = "$MAKE_CLEAN" ];then
	echo -e "\n============================================"
	echo -e "make distclean...\n"
	make ARCH=arm CROSS_COMPILE=$GCC clean

elif [ "$1" = "menuconfig" ];then
	echo -e "\n============================================"
	echo -e "make menuconfig..."
	make ARCH=arm CROSS_COMPILE=$GCC mx6ull_alientek_emmc_defconfig
	make ARCH=arm CROSS_COMPILE=$GCC menuconfig

elif [ "$1" = "$BUILD_NAND" ];then
	echo -e "请期待..."

elif [ "$1" =  "$BUILD_EMMC" ];then
	echo -e "\n============================================"
	echo -e "export mx6ull_alientek_emmc_defconfig..."
	make ARCH=arm CROSS_COMPILE=$GCC mx6ull_alientek_emmc_defconfig

	echo -e "\n============================================"
	echo -e "build u-boot...\n\n"
	make ARCH=arm CROSS_COMPILE=$GCC -j6

	echo -e "\n\n"

elif [ "$1" = "$PUSH_MASTER" ];then
	make ARCH=arm CROSS_COMPILE=$GCC distclean
	make ARCH=arm CROSS_COMPILE=$GCC clean
	git pull
	git push origin develop
elif [ "$1" = "$PUSH_DEVELOP" ];then
	make ARCH=arm CROSS_COMPILE=$GCC distclean
	make ARCH=arm CROSS_COMPILE=$GCC clean
	git pull
	git push origin master
elif [ "$1" = "$PUSH_RELEASE" ];then
	make ARCH=arm CROSS_COMPILE=$GCC distclean
	make ARCH=arm CROSS_COMPILE=$GCC clean
	git pull
	git push origin release

else
	echo "Select execute from the following command:"
	echo "    ./build.sh distclean      -- distclean project"
	echo "    ./build.sh clean          -- clean project"
	echo "    ./build.sh emmc           -- Compile the EMMC version of U-boot"
	echo -e "    ./build.sh nand           -- Compile the nand version of U-boot\n"
fi

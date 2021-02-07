# !/bash/sh

GCC="arm-linux-gnueabihf-"
EMMC='emmc'
NAND='nand'
if [ "$1" = "clean" ];then
	echo -e "make u-boot clean...\n"
	make ARCH=arm CROSS_COMPILE=$GCC distclean
	make ARCH=arm CROSS_COMPILE=$GCC clean

elif [ "$1" = "emmc" ];then
	make ARCH=arm CROSS_COMPILE=$GCC mx6ull_alientek_emmc_defconfig
	if [ "$2" = "menuconfig" ];then
		echo -e "make menuconfig..."
		make ARCH=arm CROSS_COMPILE=$GCC menuconfig
		./copy.sh $1 save
	elif [ "$2" = "" ];then
		echo -e "build emmc u-boot...\n\n"
		make ARCH=arm CROSS_COMPILE=$GCC -j8
		./copy.sh $1
	else
		echo -e "\033[31m[$0] arg \$2=<$2> parameter error!!!\033[0m"
	fi

elif [ "$1" = "nand" ];then
	make ARCH=arm CROSS_COMPILE=$GCC mx6ull_alientek_nand_defconfig
	if [ "$2" = "menuconfig" ];then
		echo -e "make nand menuconfig..."
		make ARCH=arm CROSS_COMPILE=$GCC menuconfig
		./copy.sh $1 save
	elif [ "$2" = "" ];then
		echo -e "build nand u-boot...\n\n"
		make ARCH=arm CROSS_COMPILE=$GCC -j8
		./copy.sh $1
	else
		echo -e "\033[31m[$0] arg \$2=<$2> parameter error!!!\033[0m"
	fi

else
	echo "Select execute from the following command:"
	echo "    ./build.sh clean                -- clean uboot project"
	echo "    ./build.sh emmc                 -- Compile the EMMC version of U-boot"
	echo "    ./build.sh emmc defconfig       -- Setup the EMMC version of U-boot"
	echo "    ./build.sh nand                 -- Compile the NAND version of U-boot"
	echo "    ./build.sh nand defconfig       -- Setup the NAND version of U-boot"
fi

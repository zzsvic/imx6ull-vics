# !/bash/sh

GCC="arm-linux-gnueabihf-"
CLEAN='clean'
EMMC='emmc'
NAND='nand'


# echo $1 $BUILD_DTS
if [ "$1" = "$CLEAN" ];then
	echo -e "make clean...\n"
	make ARCH=arm CROSS_COMPILE=$GCC distclean
	make ARCH=arm CROSS_COMPILE=$GCC clean

elif [ "$1" = "$NAND" ];then
		echo -e "export imx_alientek_nand_defconfig..."
		make ARCH=arm CROSS_COMPILE=$GCC imx_alientek_nand_defconfig
	if [ "$2" = "menuconfig" ];then
		echo -e "make menuconfig...\n"
		make ARCH=arm CROSS_COMPILE=$GCC menuconfig
		./copy.sh save_cfg nand
	elif [ "$2" = "zImage" ];then
		echo -e "make nand module -j8...\n"
		make ARCH=arm CROSS_COMPILE=$GCC zImage -j8 
		./copy.sh zImage nand
	elif [ "$2" = "dtbs" ];then
		echo -e "make nand dtbs -j8...\n"
		make ARCH=arm CROSS_COMPILE=$GCC dtbs -j8 
		./copy.sh dtb nand
	elif [ "$2" = "modules" ];then
		echo -e "make nand module -j8...\n"
		make ARCH=arm CROSS_COMPILE=$GCC modules -j8 
		./copy.sh ko
	else
		echo -e "make all -j8...\n"
		make ARCH=arm CROSS_COMPILE=$GCC all -j8 
		./copy.sh nand
	fi

elif [ "$1" = "$EMMC" ];then
		echo -e "export imx_alientek_emmc_defconfig..."
		make ARCH=arm CROSS_COMPILE=$GCC imx_alientek_emmc_defconfig
	if [ "$2" = "menuconfig" ];then
		echo -e "make emmc menuconfig...\n"
		make ARCH=arm CROSS_COMPILE=$GCC menuconfig
		./copy.sh save_cfg emmc
	elif [ "$2" = "zImage" ];then
		echo -e "make emmc zImage -j8..."
		make ARCH=arm CROSS_COMPILE=$GCC zImage -j8 
		./copy.sh zImage emmc
	elif [ "$2" = "dtbs" ];then
		echo -e "make emmc dtbs -j8..."
		make ARCH=arm CROSS_COMPILE=$GCC dtbs -j8 
		./copy.sh dtb emmc
	elif [ "$2" = "modules" ];then
		echo -e "make emmc module -j8...\n"
		make ARCH=arm CROSS_COMPILE=$GCC modules -j8 
		./copy.sh ko
	else
		echo -e "make emmc all -j8..."
		make ARCH=arm CROSS_COMPILE=$GCC all -j8 
		./copy.sh emmc
	fi

else
	echo "Select execute from the following command:"
	echo "    ./build.sh clean              -- clean project"
	echo "    ./build.sh nand menuconfig    -- make menuconfig<nand>"
	echo "    ./build.sh emmc menuconfig    -- make menuconfig<emmc>"
	echo "    ./build.sh nand               -- make all<nand>"
	echo "    ./build.sh emmc               -- make all<emmc>"
	echo "    ./build.sh nand modules       -- make modules<nand>"
	echo "    ./build.sh emmc modules       -- make modules<emmc>"
	echo "    ./build.sh nand dtbs          -- make dts<nand>"
	echo "    ./build.sh emmc dtbs          -- make dts<emmc>"
fi

exit

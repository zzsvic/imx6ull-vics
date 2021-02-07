# !/bash/sh

GCC="arm-linux-gnueabihf-"
CLEAN='clean'
EMMC='emmc'
NAND='nand'
EMMC_CFG='emmc defconfig'
NAND_CFG='nand defconfig'

if [ "$1" = "$CLEAN" ];then
	echo -e "make u-boot clean...\n"
	make ARCH=arm CROSS_COMPILE=$GCC distclean
	make ARCH=arm CROSS_COMPILE=$GCC clean

elif [ "$1" = "$NAND_CFG" ];then
	echo -e "\n==============================================================================="
	echo -e "make menuconfig..."
	make ARCH=arm CROSS_COMPILE=$GCC mx6ull_alientek_nand_defconfig
	make ARCH=arm CROSS_COMPILE=$GCC menuconfig

elif [ "$1" = "$EMMC_CFG" ];then
	echo -e "\n==============================================================================="
	echo -e "make menuconfig..."
	make ARCH=arm CROSS_COMPILE=$GCC mx6ull_alientek_emmc_defconfig
	make ARCH=arm CROSS_COMPILE=$GCC menuconfig

elif [ "$1" =  "$NAND" ];then
	echo -e "\n==============================================================================="
	echo -e "build nand u-boot..."
	make ARCH=arm CROSS_COMPILE=$GCC mx6ull_alientek_nand_defconfig
	make ARCH=arm CROSS_COMPILE=$GCC -j8

elif [ "$1" =  "$EMMC" ];then
	echo -e "\n==============================================================================="
	echo -e "build emmc u-boot...\n\n"
	make ARCH=arm CROSS_COMPILE=$GCC mx6ull_alientek_emmc_defconfig
	make ARCH=arm CROSS_COMPILE=$GCC -j8

else
	echo "Select execute from the following command:"
	echo "    ./build.sh distclean      -- distclean project"
	echo "    ./build.sh clean          -- clean project"
	echo "    ./build.sh emmc           -- Compile the EMMC version of U-boot"
	echo "    ./build.sh nand           -- Compile the NAND version of U-boot"
fi

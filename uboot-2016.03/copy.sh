#########################################################################
# File Name     : copy.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2021年02月07日 星期日 22时19分42秒
#########################################################################

#!/bin/bash
IMG_DIR='../out/Image'
NAME_EMMC_UBOOT='u-boot-alientek-emmc.imx'
NAME_NAND_UBOOT='u-boot-alientek-nand.imx'
UBOOT_EMMC_CFG='./configs/mx6ull_alientek_emmc_defconfig'
UBOOT_NAND_CFG='./configs/mx6ull_alientek_nand_defconfig'

copy_uboot(){
	if [ "$1" = "emmc" ];then
		cp u-boot.imx $IMG_DIR/$NAME_EMMC_UBOOT
	elif [ "$1" = "nand" ];then
		cp u-boot.imx $IMG_DIR/$NAME_NAND_UBOOT
	else
		echo -e "\033[31m[$0] Function \033[33mcopy_uboot()\033[31m <$1> parameter error!!!\033[0m"
	exit
	fi
}

save_defconfig(){
	if [ "$1" = "emmc" ];then
		cp .config $UBOOT_EMMC_CFG
	elif [ "$1" = "nand" ];then
		cp .config $UBOOT_NAND_CFG
	else
		echo -e "\033[31m[$0] Function \033[33msave_defconfig()\033[31m <$1> parameter error!!!\033[0m"
	exit
	fi
}

if [ "$2" = "save" ];then
	save_defconfig $1
	echo -e "\033[32m[$0] save <$1> config done!\033[0m"
	exit
fi

copy_uboot $1
if [ "$1" = "emmc" ];then
	echo -e "\033[32m[$0] copy $NAME_EMMC_UBOOT done!\033[0m"
elif [ "$1" = "nand" ];then
	echo -e "\033[32m[$0] copy $NAME_NAND_UBOOT done!\033[0m"
else
	echo -e "\033[31m[$0] <$1> parameter error!!!\033[0m"
fi


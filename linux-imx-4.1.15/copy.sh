#########################################################################
# File Name     : copy_ko.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2021年02月07日 星期日 19时56分21秒
#########################################################################

#!/bin/bash

MOD_DIR='../out/modules/'
IMG_DIR='../out/Image/'

NAME_EMMC_DTB='imx6ull-alientek-emmc.dtb'
NAME_EMMC_IMG='zImage-alientek-emmc'

NAME_NAND_DTB='imx6ull-alientek-nand.dtb'
NAME_NAND_IMG='zImage-alientek-nand'

copy_ko(){
	echo "copy *.ko"
	cp ./drivers/i2c/algos/i2c-algo-pca.ko $MOD_DIR
	cp ./drivers/i2c/algos/i2c-algo-pcf.ko $MOD_DIR
	cp ./drivers/rpmsg/imx_rpmsg_tty.ko $MOD_DIR
	cp ./drivers/rpmsg/imx_rpmsg_pingpong.ko $MOD_DIR
	cp ./drivers/net/wireless/realtek/rtl8192CU/8192cu.ko $MOD_DIR
	cp ./drivers/net/wireless/realtek/rtl8188EUS/8188eu.ko $MOD_DIR
	cp ./drivers/net/wireless/realtek/rtl8189FS/8189fs.ko $MOD_DIR
	cp ./drivers/net/wireless/brcm80211/brcmfmac/brcmfmac.ko $MOD_DIR
	cp ./drivers/net/wireless/brcm80211/brcmutil/brcmutil.ko $MOD_DIR
	cp ./drivers/usb/host/ohci-hcd.ko $MOD_DIR
	cp ./drivers/input/evbug.ko $MOD_DIR
	cp ./drivers/input/serio/serport.ko $MOD_DIR
	cp ./drivers/input/mouse/psmouse.ko $MOD_DIR
	cp ./lib/libcrc32c.ko $MOD_DIR
	cp ./lib/crc-itu-t.ko $MOD_DIR
	cp ./lib/crc-ccitt.ko $MOD_DIR
	cp ./lib/crc7.ko $MOD_DIR
	cp ./fs/fat/msdos.ko $MOD_DIR
	cp ./fs/binfmt_misc.ko $MOD_DIR
	cp ./fs/isofs/isofs.ko $MOD_DIR
	cp ./fs/nls/nls_iso8859-15.ko $MOD_DIR
	cp ./fs/udf/udf.ko $MOD_DIR
}

copy_zImage(){
	echo -e "copy image"
	if [ $1 = "emmc" ];then
		cp ./arch/arm/boot/zImage $IMG_DIR/$NAME_EMMC_IMG
	fi
	if [ $1 = "nand" ];then
		cp ./arch/arm/boot/zImage $IMG_DIR/$NAME_NAND_IMG
	fi
}

copy_dtb(){
	echo -e "copy dtb"
	if [ "$1" = "emmc" ];then
		cp ./arch/arm/boot/dts/imx6ull-alientek-emmc.dtb $IMG_DIR/$NAME_EMMC_DTB
	fi
	if [ "$1" = "nand" ];then
		cp ./arch/arm/boot/dts/imx6ull-alientek-emmc.dtb $IMG_DIR/$NAME_NAND_DTB
	fi
}

save_defconfig(){
	if [ "$1" = "emmc" ];then
		cp .config ./arch/arm/configs/imx_alientek_emmc_defconfig
	elif [ "$1" = "nand" ];then
		cp .config ./arch/arm/configs/imx_alientek_nand_defconfig
	else
		echo -e "\033[31m[$0] Function \033[33msave_defconfig()\033[31m <$1> parameter error!!!\033[0m"
	fi
}

copy_all(){
	copy_zImage $1
	copy_dtb $1
	copy_ko
}

if [ "$1" = "ko" ];then
	copy_ko
	echo -e "\033[32m[$0] .$1 copy done!\033[0m"
elif [ "$1" = "zImage" ] || [ "$1" = "uImage" ];then
	copy_zImage $2
	echo -e "\033[32m[$0] $1 copy done!\033[0m"
elif [ "$1" = "dtb" ];then
	copy_dtb $2
	echo -e "\033[32m[$0] $1 copy done!\033[0m"
elif [ "$1" = "emmc" ] || [ "$1" = "nand" ];then
	copy_all $1
	echo -e "\033[32m[$0] zImage dtb and .ko copy done!\033[0m"
elif [ "$1" = "save_cfg" ];then
	save_defconfig $2
	echo -e "\033[32m[$0] save imx_alientek_$2_defconfig copy done!\033[0m"
else
	echo -e "\033[31m[$0] <$1> parameter error!!!\033[0m"
	exit
fi


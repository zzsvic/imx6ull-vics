#########################################################################
# File Name     : build.sh
# Author        : zhou.zhaosong
# mail          : zzsvic@163.com
# Created Time  : 2021年02月01日 星期一 23时14分20秒
#########################################################################

#!/bin/bash

echo "./build.sh clean          -- clean..."
echo "./build.sh uboot          -- build uboot emmc..."
echo "./build.sh uboot nand     -- build uboot nand..."
echo "./build.sh linux          -- build linux kernel emmc..."
echo "./build.sh linux nand     -- build linux kernel nand..."
echo "./build.sh dts            -- build linux dts..."
echo "./build.sh module         -- build linux module..."
echo "./build.sh busybox        -- build busybox rootfd..."
echo "./build.sh buildroot      -- build buildroot rootfs..."
echo "./build.sh all            -- build uboot linux buildroot..."
echo "./build.sh all busybox    -- build uboot linux busybox..."

echo "Done!!!"

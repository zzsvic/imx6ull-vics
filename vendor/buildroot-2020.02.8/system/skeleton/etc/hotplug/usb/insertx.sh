# !/bin/sh

MOUNT_SOURCE=/media/udisk
NUMBER=${MDEV#*sda}
MOUNT_POINT=${MOUNT_SOURCE}/${NUMBER}

if [ ! -f $MDEV ];then
    if [ ! -d $MOUNT_POINT ]; then
        mkdir -p $MOUNT_POINT
    fi

    echo "${MDEV} usb insertx"
    echo "create usb disk mout point: $MOUNT_POINT." > /dev/console

    mount -t vfat,exfat,ntfs /dev/$MDEV $MOUNT_POINT
    if [ $? -ne 0 ];then 
        echo "mount usb disk ${MDEV} failed!" > /dev/console
    else
        echo "mount usb disk successfully!" > /dev/console
    fi
fi

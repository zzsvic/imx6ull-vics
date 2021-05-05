# !/bin/sh

MOUNT_POINT=/media/udisk

if [ ! -f $MDEV ];then
    if [ ! -d $MOUNT_POINT ]; then
        echo "create usb disk mout point: $MOUNT_POINT." > /dev/console
        mkdir -p $MOUNT_POINT
    fi

    echo "${MDEV} usb insert"
    sleep 0.5

    if [ -e "/dev/sda1" ]; then
        echo "${MDEV} don't have to create " > /dev/console
        exit
    fi

    mount -t vfat,exfat,ntfs /dev/$MDEV $MOUNT_POINT
    if [ $? -ne 0 ]; then
        echo "mount usb disk ${MDEV} falied!" > /dev/console
    else
        echo "mount usb disk successfully!" > /dev/console
    fi
fi

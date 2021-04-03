#!/bin/sh

POINT_SOURCE=/media/udisk
NUMBER=${MDEV#*sda}
MOUNT_POINT=${POINT_SOURCE}${NUMBER}

umount $MOUNT_POINT
if [ $? -ne 0 ]; then
    echo "umount usb disk falied! [${MDEV}] " > /dev/console
else
    echo "umount usb disk successfully!" > /dev/console
fi
rm -rf $MOUNT_POINT
echo "remove usb disk mount point: $MOUNT_POINT." > /dev/console

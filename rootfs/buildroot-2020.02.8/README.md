# buildroot2020.02.08
imx6ull buildroot rootfs

1. build...
  sudo make
2. config...
  make menuconfig
 
3.解压...
root.tar : output/image
tar -vxf rootfs.tar 
4.打包...
cd rootfd
tar -vcjf rootfs-alientek-emmc.tar.bz2 *

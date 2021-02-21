# !/bash/sh

OUT_DIR='../../openssl/'
ABS_DIR=$(cd "$(dirname "$OUT_DIR")"; pwd)/$(basename "$OUT_DIR")

./Configure linux-armv4 shared no-asm --prefix=$ABS_DIR CROSS_COMPILE=arm-linux-gnueabihf-

make
make install


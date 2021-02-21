# !/bash/sh

OUT_DIR='../../expat/'
ABS_DIR=$(cd "$(dirname "$OUT_DIR")"; pwd)/$(basename "$OUT_DIR")

./configure --without-tests --without-examples --prefix=$ABS_DIR --host=arm-linux-gnueabihf

make
make install


# !/bash/sh

OUT_DIR='../../libnl/'
ABS_DIR=$(cd "$(dirname "$OUT_DIR")"; pwd)/$(basename "$OUT_DIR")
./configure --host=arm-linux-gnueabihf --prefix=$ABS_DIR
make $1
make install


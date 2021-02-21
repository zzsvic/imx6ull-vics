# !/bash/sh

OUT_DIR='../../dbus/'
ABS_DIR=$(cd "$(dirname "$OUT_DIR")"; pwd)/$(basename "$OUT_DIR")
EXPAT=$(cd "$(dirname "$OUT_DIR")"; pwd)/$(basename "../../expat/")
echo $EXPAT

./configure --host=arm-linux --prefix=$ABS_DIR CC=arm-linux-gnueabihf-gcc --cache-file=arm-linux.cache --without-x "LIBS=-L$EXPAT/lib" "CFLAGS=-I$EXPAT/include"
# ./configure --host=arm-linux-gnueabihf- --prefix=$ABS_DIR  --cache-file=arm-linux.cache --without-x  "LIBS=-L$EXPAT/lib" "CPFLAGS=-I$EXPAT/include"
make
make install


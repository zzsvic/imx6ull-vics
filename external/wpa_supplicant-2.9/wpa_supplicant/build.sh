# !/bash/sh

OUT_DIR='../tools/libnl/lib/pkgconfig'
ABS_DIR=$(cd "$(dirname "$OUT_DIR")"; pwd)/$(basename "$OUT_DIR")
export PKG_CONFIG_PATH=$ABS_DIR:$PKG_CONFIG_PATH
cp imx6ull_defconfig .config
make $1

cp wpa_cli ../output/
cp wpa_supplicant ../output/

#!/bin/bash

export ARCH=arm64
export SUBARCH=arm64
export HEADER_ARCH=arm64
export CLANG_PATH=/home/pzqqt/bin/android_prebuilts_clang_host_linux-x86_clang-5484270
export KBUILD_COMPILER_STRING=$($CLANG_PATH/bin/clang --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')

export KBUILD_BUILD_HOST="lenovo"
export KBUILD_BUILD_USER="pzqqt"

export LOCALVERSION=-v5.3
make mrproper O=out && \
make whyred_defconfig O=out && \
make -j6 \
	O=out \
	CC="ccache $CLANG_PATH/bin/clang" \
	CLANG_TRIPLE=aarch64-linux-gnu- \
	CROSS_COMPILE=/home/pzqqt/bin/gcc-linaro-7.4.1-2019.02-rc1-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu- \
	CROSS_COMPILE_ARM32=/home/pzqqt/bin/gcc-linaro-7.4.1-2019.02-rc1-x86_64_arm-linux-gnueabi/bin/arm-linux-gnueabi-

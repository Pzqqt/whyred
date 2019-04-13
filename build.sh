#!/bin/bash

export ARCH=arm64
export SUBARCH=arm64
export HEADER_ARCH=arm64
export CLANG_PATH=/home/pzqqt/bin/android_prebuilts_clang_host_linux-x86_clang-r353983
export KBUILD_COMPILER_STRING=$($CLANG_PATH/bin/clang --version | head -n 1 | perl -pe 's/\(http.*?\)//gs' | sed -e 's/  */ /g' -e 's/[[:space:]]*$//')
export CROSS_COMPILE=/home/pzqqt/bin/gcc-linaro-7.4.1-2019.02-rc1-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=/home/pzqqt/bin/gcc-linaro-7.4.1-2019.02-rc1-x86_64_arm-linux-gnueabi/bin/arm-linux-gnueabi-

export KBUILD_BUILD_HOST="lenovo"
export KBUILD_BUILD_USER="pzqqt"

export LOCALVERSION=-v5.2-rebase-uv
make O=out mrproper && make O=out whyred_defconfig && make O=out CLANG_TRIPLE=aarch64-linux-gnu- CC="ccache $CLANG_PATH/bin/clang" -j6

#!/bin/bash
rm -rf modules
export CONFIG_FILE="cyanogenmod_z2_plus_defconfig"
export ARCH="arm64"
export CROSS_COMPILE="aarch64-linux-android-"
export TOOL_CHAIN_PATH="${HOME}/android/current/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin/"
export CONFIG_ABS_PATH="arch/${ARCH}/configs/${CONFIG_FILE}"
export PATH=$PATH:${TOOL_CHAIN_PATH}
export objdir="${HOME}/Desktop/z2/obj"
export sourcedir="${HOME}/Desktop/z2"
compile() {
  make O=$objdir ARCH=arm64 CROSS_COMPILE=${TOOL_CHAIN_PATH}/${CROSS_COMPILE}  $CONFIG_FILE -j$(nproc --all)
  make O=$objdir -j$(nproc --all)
}

compile 

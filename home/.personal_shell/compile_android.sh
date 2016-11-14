#!/bin/bash
LUNCH_NUM=18
KERNEL_DIR=./android_kernel
TARGET_KERNEL_DIR=./device/lge/bullhead-kernel

export_env()
{
    export PATH=$(pwd)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin:$PATH
    export ARCH=arm64
    export CROSS_COMPILE=aarch64-linux-android-
}
source_init()
{
    if [ ! -n "$TARGET_PRODUCT" ]; then
        source ./build/envsetup.sh && lunch $LUNCH_NUM
    fi 
}
copy_kernel()
{
    if [ $? -eq 0 ]; then
        cd ..
        cp $KERNEL_DIR/arch/arm64/boot/Image.gz-dtb $TARGET_KERNEL_DIR
    else
        echo "compile kernel error"
        exit
    fi
}
compile_kernel()
{
    cd $KERNEL_DIR
    echo "$(pwd)"
    if [ ! -f ".config" ]; then
        make bullhead_defconfig && make menuconfig && make
        copy_kernel
    else
        make menuconfig &&  make
        copy_kernel
    fi
}

#main
if [ $# -eq 0 ]; then
    source_init
    make -j4
else
    while getopts ":akq" opt
    do
        case $opt in
            a)
                source_init
                export_env
                compile_kernel
                make -j4
                ;;
            k)
                source_init
                export_env
                compile_kernel
                ;;
            q)
                source_init
                make -j4
                ;;
            ?)
                sl
                ;;
        esac
    done
fi

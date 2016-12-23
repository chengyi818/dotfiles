#!/bin/bash

if [ ! "$1" ]; then
    sl
elif [ "$1" -eq 5 ]; then
    adb push ~/code/android_5.0.1/out/target/product/pxa1908sl/system/lib/libwheeljack.so                    /data/local/tmp/
    adb push ~/code/android_5.0.1/out/target/product/pxa1908sl/system/bin/wheeljack                          /data/local/tmp/
    adb push ~/code/android_5.0.1/out/target/product/pxa1908sl/system/lib/CVE-2014.so                        /data/local/tmp/
    adb push ~/code/android_5.0.1/out/target/product/pxa1908sl/system/lib/CVE-2015.so                        /data/local/tmp/
    adb push ~/code/android_5.0.1/out/target/product/pxa1908sl/system/lib/CVE-2016.so                        /data/local/tmp/
elif [ "$1" -eq 6 ]; then
    adb push ~/code/android_6.0.1/out/target/product/bullhead/system/lib/libwheeljack.so                    /data/local/tmp/
    adb push ~/code/android_6.0.1/out/target/product/bullhead/system/bin/wheeljack                          /data/local/tmp/
    adb push ~/code/android_6.0.1/out/target/product/bullhead/system/lib/CVE-2014.so                        /data/local/tmp/
    adb push ~/code/android_6.0.1/out/target/product/bullhead/system/lib/CVE-2015.so                        /data/local/tmp/
    adb push ~/code/android_6.0.1/out/target/product/bullhead/system/lib/CVE-2016.so                        /data/local/tmp/
fi

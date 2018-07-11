#!/bin/bash
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip \platform-tools-latest-linux.zip
sudo cp platform-tools/adb /usr/local/sbin/adb
sudo cp platform-tools/fastboot /usr/local/sbin/fastboot

#!/bin/bash
sudo service udev restart
adb kill-server
sudo adb start-server

#!/bin/bash
xrandr --output eDP1 --mode 1920x1080 --pos 0x0 --output VGA1 --primary --mode 1600x900 --pos 1920x0 --output HDMI1 --mode 1600x900 --pos 3520x0
xbacklight -set 60

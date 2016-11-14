#!/bin/bash
### BEGIN INIT INFO
# Provides:          scriptname
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO
xrandr --output DVI-0 --mode 1680x1050 --pos 0x0 --output DisplayPort-0 --mode 1920x1080 --pos 1680x0

#xbacklight -set 60
#xrandr -r 75
#nmcli dev disconnect iface wlan0
#sudo setcap cap_net_admin=ep $(which i3status)

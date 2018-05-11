#/bin/bash
pkill fcitx && fcitx && sogou-qimpanel && sogou-qimpanel-watchdog
#fcitx-qimpanel

rm -rf ~/.config/SogouPY 
rm -rf ~/.config/SogouPY.users
rm -rf ~/.config/sogou-qimpanel

pidof fcitx | xargs kill
pidof sogou-qimpanel | xargs kill
nohup fcitx  1>/dev/null 2>/dev/null &
nohup sogou-qimpanel  1>/dev/null 2>/dev/null &

fcitx-autostart &

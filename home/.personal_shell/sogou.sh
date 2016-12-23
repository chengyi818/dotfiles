#/bin/bash
pkill fcitx && fcitx && sogou-qimpanel
fcitx-autostart &
#fcitx-qimpanel

#pidof fcitx | xargs kill
#pidof sogou-qimpanel | xargs kill
#nohup fcitx  1>/dev/null 2>/dev/null &
#nohup sogou-qimpanel  1>/dev/null 2>/dev/null &

#!/bin/bash
#自动安装大量软件

sudo apt-get install -y zsh wget tmux git vim gitk  python-pip python-dev\
smplayer shutter libgoo-canvas-perl openvpn  minicom wireshark tftp-hpa\
libnet-tftp-perl tftpd-hpa xinetd roxterm kde-full meld gcc g++  binutils\
patch  bzip2 flex  bison  make autoconf gettext  texinfo  unzip sharutils\
subversion  libncurses5-dev  ncurses-term  zlib1g-dev gawk asciidoc libz-dev multitail

if [ ! -d "~/.oh-my-zsh" ]; then
    wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
fi
chsh -s /bin/zsh

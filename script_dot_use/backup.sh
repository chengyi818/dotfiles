#!/usr/bin/env bash

######################## BASIC VARIANT
backup_files=(".vim" ".vimrc" ".bashrc" ".zshrc" ".vimrc.local" ".vimrc.before.local" ".script" ".tmux.conf" ".ycm_extra_conf.py" ".vimrc.bundles.local" ".gitconfig" ".gvimrc")

######################## BASIC SETUP TOOLS
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

################################## SETUP FUNCTIONS
do_backup() {
    if [ -e "$HOME/$1" ]; then
        today=`date +%Y%m%d_%s`
        [ ! -L "$HOME/$1" ] && mv -v "$HOME/$1" "$HOME/.homesick/dotfiles_old/$1.$today";
   fi
}

######################## MAIN()
#backup files
echo "现在备份原有文件"
mkdir -p $HOME/.homesick/dotfiles_old

for i in ${backup_files[@]}; do
    do_backup "$i"
done
echo "备份完成"

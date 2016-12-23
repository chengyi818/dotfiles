#!/usr/bin/env bash
######################## BASIC VARIANT
backup_files=(".vim" ".vimrc" ".bashrc" ".zshrc" ".vimrc.local" ".vimrc.before.local" ".script" ".tmux.conf" ".ycm_extra_conf.py" ".vimrc.bundles.local" ".gitconfig" ".gvimrc .emacs.d .spacemacs .font .spacemacs.d")

REPO_URL='git@github.com:chengyi818/dotfiles.git'

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

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}
program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exists $1

    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

install_essential_package() {
	echo "安装一些必要的软件将花费一定时间，请耐心等待直到安装完成^_^"
    	program_exists homesick
    	# throw error on non-zero return value
    	if [ "$?" -ne 0 ]; then
		sudo gem install homesick
    	fi

	if which apt-get >/dev/null; then
		sudo apt-get install -y tmux zsh git cmake build-essential python-dev exuberant-ctags cscope autojump trash-cli i3 i3status dmenu i3lock scrot xbacklight alsamixergui gnome-control-center network-manager network-manager-gnome texinfo libx11-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev libxpm-dev automake autoconf
	elif which yum >/dev/null; then
		sudo yum install  -y tmux zsh git cmake build-essential python-dev exuberant-ctags cscope autojump trash-cli i3 i3status dmenu i3lock scrot xbacklight alsamixergui gnome-control-center network-manager network-manager-gnome
	else
		echo "无法帮你自动安装基本软件,请手动安装!"
	fi
}
################################## SETUP FUNCTIONS
do_backup() {
    if [ -e "$HOME/$1" ]; then
        today=`date +%Y%m%d_%s`
        [ ! -L "$HOME/$1" ] && cp -fpR "$HOME/$1" "$HOME/.homesick/dotfiles_old/$1.$today";
   fi
}

######################## MAIN()
#Install some essential package
install_essential_package

#Download chengyi818 dotfiles
program_must_exist "homesick"
echo "正在下载我为您精心准备的配置"
homesick clone "$REPO_URL"

#backup files
echo "现在备份原有文件到~/.homesick/dotfiles_old"
mkdir -p $HOME/.homesick/dotfiles_old

for i in ${backup_files[@]}; do
    do_backup "$i"
done
echo "备份完成"


#自动安装oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "还没有安装oh-my-zsh,现在帮您自动安装,请耐性等待"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    if [ -d ~/.oh-my-zsh ]; then
	    echo "oh-my-zsh安装完毕"
    fi
fi


#homesick自动创建软链接
echo "下面为您创建软链接"
homesick link --force dotfiles
echo "软链接创建完毕"

#自动安装spf13框架
if [ ! -d ~/.spf13-vim-3 ]; then
    echo "下面为您安装spf13 vim框架"
    curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
    echo "spf13 vim安装完毕"
fi

if which apt-get >/dev/null; then
    if which fuck >/dev/null; then
        echo "thefuck已经安装"
    else
        wget -O - https://raw.githubusercontent.com/nvbn/thefuck/master/install.sh | sh - && $0
        ret="$?"
        if [ "$ret" -ne '0' ];then
            echo "神奇的工具thefuck没有安装成功~,现在帮你取消这部分的设置"
            sed -i '/^eval/d' $HOME/.zshrc
        fi
    fi
fi

#source everything
source ~/.bashrc
source ~/.vimrc
source ~/.zshrc

#download spacemacs config
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

#自动编译YCM
echo "现在默认的代码补全工具是YouCompleteMe."
echo "Ubuntu/Mint 64位快速编译,请在命令行运行YCM"

#emacs
echo "emacs in software repository is old,so you need compile emacs by hand."

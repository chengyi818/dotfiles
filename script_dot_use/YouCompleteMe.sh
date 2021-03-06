#!/bin/bash
if [ -d ~/.vim/bundle/YouCompleteMe ];then
    if which apt-get >/dev/null; then
        if [ $(getconf WORD_BIT)  = '32' ] && [ $(getconf LONG_BIT) = '64' ];then
            cd ~/.vim/bundle/YouCompleteMe
            git pull
            git submodule update --init --recursive
            ./install.py --clang-completer
            ret="$?"
            if [ "$ret" -ne '0' ];then
                echo "编译YouCompleteMe的过程中出错啦,现在帮您更换代码补全工具"
                echo "let g:spf13_bundle_groups=['general', 'writing', 'youcompleteme', 'programming', 'python', 'javascript', 'html', 'misc',]" > ~/.vimrc.before.fork
                vim -u "~/.spf13-vim-3/.vimrc.bundles.default" "+set nomore" "+BundleInstall!" "+BundleClean" "+qall"
            fi
        fi
    else
        echo "看起来,你必须自己手动编译YouCompleteME了"
    fi
else
    echo "还没有下载YCM"
fi

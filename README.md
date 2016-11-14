## dotfiles
本人应该算是伪工具控,参考网上资料,构建了自己的配置,欢迎fork或者下载使用.

##快速下载使用办法

我使用的系统是Linux Mint 17.3 Rosa 64位.
其他系统一键安装可能会有问题.但是框架和配置还是可以参考的.

### 备份说明

> 妹妹,你大胆地向前走

原先所有配置会被备份在`~/.homesick/dotfiles_old`中

### 快速使用说明

请首先安装curl工具.

sudo apt-get install curl

然后执行以下命令即可:

curl --silent
https://raw.githubusercontent.com/chengyi818/dotfiles/master/install.sh | bash

## 说明
主要针对文本三巨头tmux,zsh和vim的设置

dotfilesd的同步框架选用[homesick](https://github.com/technicalpickles/homesick)

tmux设置相对比较简单,是我自己写的.

zsh设置使用的是[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

vim使用的是[spf13](https://github.com/spf13/spf13-vim).
更新插件命令:
```
vim +BundleInstall! +BundleClean +q
```
此外还包括git和bash的设置.

##备注:

### 一

git的用户名和邮箱需要修改;

git config --global user.name "XXX"

git config --global user.mail "XXX@XXX"

### 二

安装过程中手动操作可能包括

> 刚开始的时候需要输入root密码

## 改动说明

### 一
spf13默认的代码补全插件是neocomplete,我把它改成了更强大的YouCompleteMe.

当然用过YCM的同学都知道这个强大的插件需要编译,[编译详细方法](https://github.com/Valloric/YouCompleteMe)

64位的Ubuntu或者Mint可以在终端执行

> `bash ~/.homesick/repos/dotfiles/script_dot_use/YouCompleteMe.sh`

### oh-my-zsh
如果你之前不是使用的zsh,那么需要将你的终端改为/bin/zsh,请参考[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

## 详细说明
我的同事张瑞和我写了一份相对[详细使用说明](https://github.com/chengyi818/dotfiles/blob/master/dotfiles.md),包括我们常用的代码跳转和vim插件的说明.希望可以帮助到大家.

## 待完成事项
- [] 增加oh-my-zsh简要使用说明
- [] 增加homesick简要使用说明
- [] 增加vim部分重要插件简要使用说明
- [] 增加根据母版用户如何定制自己的dotfiles的说明
- [] 重新检查修订tmux设置

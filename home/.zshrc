# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="terminalparty"
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump extract colored-man-pages sudo copydir history copyfile command-not-found tmux emoji adb git-extras zsh-autosuggestions)
# User configuration
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:~/.local/bin:/opt/android-studio/bin:~/Android/Sdk/tools:$PATH
source $ZSH/oh-my-zsh.sh
# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi
# Compilation flags
export ARCHFLAGS="-arch x86_64"
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# base alias
alias -s txt="vim"
alias ls="ls --color=auto"
alias ll="ls --color -al"
alias grep='grep --color=auto'
alias c="clear"

alias emacs="setsid env LC_CTYPE=zh_CN.UTF-8 emacs >/dev/null 2>&1 &"
alias pc="source ~/.script/proxyrc"
alias rebuild="~/.script/rebuild"
alias csclean="~/.script/csclean"
alias YCM="~/.script/YouCompleteMe.sh"
alias psg="ps aux | grep"
alias dstat="dstat -cdlmnpsy"
alias py2="python2"
alias py3="python3"
alias pydis3="python3 ~/.script/person_shell/pydis.py"
alias pydis2="python2 ~/.script/person_shell/pydis.py"
alias pydis2.5="python2.5 ~/.script/person_shell/pydis.py"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias apl='ap() { adb push $1 /data/local/tmp;}; ap'
alias aps='ap() { adb push $1 /sdcard/脚本;}; ap'

# autojump setting
[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh

# trash-cli setting
# trash-put          将文件或目录移入回收站
# trash-empty        清空回收站
# trash-list         列出回收站中的文件
# restore-trash      还原回收站中的文件
# trash-rm           删除回首站中的单个文件
alias rmf="/bin/rm"
alias rm="trash-put"
alias lstrash="trash-list"

#enable python plugin thefuck
eval $(thefuck --alias)

# node version manager
export NVM_DIR="/home/chengyi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# android
export NDK_HOME=/home/chengyi/Android/Sdk/ndk-bundle/
export PATH=/home/chengyi/Android/Sdk/ndk-bundle:$PATH
alias repo="~/bin/repo"

# support snap
export PATH=/snap/bin/:$PATH

# python pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 小函数
mcd() { mkdir -p "$1"; cd "$1";}
cls() { cd "$1"; ls;}
backup() { cp "$1"{,.bak};}
md5check() { md5sum "$1" | grep "$2";}
sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}

# 重复运行shell命令
function run() {
    number=$1
    shift
    for n in $(seq $number); do
        $@
    done
}

# pet https://github.com/knqyf263/pet
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select

# chromium
PATH=$PATH:/home/chengyi/code/github/public/depot_tools;export PATH;

# ADDED BY INSTALLER - DO NOT EDIT OR DELETE THIS COMMENT - 87FF8EFC-483D-BCAA-D67D-735CF60410D1 844202D4-D736-5E2B-A343-3DBA463EF213
PATH=$PATH:/home/chengyi/Documents/software/010Editor;export PATH;

# iphone
# conflict with xv6 compile
# [ ! -d "$HOME/usr/src"  ] && mkdir -p "$HOME/usr/src"
# export PKG_CONFIG_PATH="${HOME}/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
# export CPATH="${CPATH}:${HOME}/usr/include"
# export MANPATH="${MANPATH}:${HOME}/usr/share/man"
# export PATH="${PATH}:${HOME}/usr/bin"
# export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${HOME}/usr/lib"

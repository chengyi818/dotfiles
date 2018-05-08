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
plugins=(git autojump extract colored-man-pages sudo copydir history copyfile command-not-found tmux emoji adb git-extras)
# User configuration
export PATH=~/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin:/home/chengyi/Android/Sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/android-studio/bin:~/Android/Sdk/tools:$PATH
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
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias sourzsh="source ~/.zshrc"
alias -s txt="vim"
alias emacs="setsid env LC_CTYPE=zh_CN.UTF-8 emacs >/dev/null 2>&1 &"
alias rebuild="~/.script/rebuild"
alias csclean="~/.script/csclean"
alias list="svn st -q"
alias YCM="~/.script/YouCompleteMe.sh"
alias svnmeld="svn diff --diff-cmd=meld"
alias ls="ls --color=auto"
alias ll="ls --color -al"
alias grep='grep --color=auto'
mcd() { mkdir -p "$1"; cd "$1";}
cls() { cd "$1"; ls;}
backup() { cp "$1"{,.bak};}
md5check() { md5sum "$1" | grep "$2";}
alias makescript="fc -rnl | head -1 >"
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
alias c="clear"
alias ai="sudo proxychains apt-get install"
alias pi3="sudo pip3 install"
alias py2="python2"
alias py3="python3"
alias t="tree -ah --du"
#System info
alias cmount="mount | column -t"
sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"
alias psg="ps aux | grep"
alias meminfo='free -m -l -t'
alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"
#Network
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
alias listen="lsof -P -i -n"
alias port='netstat -tulanp'
#for dstat tool
alias dstat="dstat -cdlmnpsy"
#force tmux support 256 color
alias  tmux="tmux -2"
#autojump setting
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
#安装命令 wget -O - https://raw.githubusercontent.com/nvbn/thefuck/master/install.sh | sh - && $0
eval $(thefuck --alias)

# node version manager
export NVM_DIR="/home/chengyi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# android
export NDK_HOME=/home/chengyi/Android/Sdk/ndk-bundle/
export PATH=/home/chengyi/Android/Sdk/ndk-bundle/:$PATH
alias repo="~/bin/repo"

# python pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# 重复运行shell命令
function run() {
    number=$1
    shift
    for n in $(seq $number); do
        $@
    done
}

function emulator {
    ( cd "$(dirname "$(whence -p emulator)")" && ./emulator "$@" &; )
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# support snap
export PATH=/snap/bin/:$PATH

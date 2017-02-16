# .bashrc

export PATH=~/bin:$PATH
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias rebuild="~/.script/rebuild"
alias csclean="~/.script/csclean"
alias YCM="~/.script/YouCompleteMe.sh"
alias list="svn st -q"
alias svnmeld="svn diff --diff-cmd=meld"
alias emacs="nohup env LC_CTYPE=zh_CN.UTF-8 emacs &;rm nohup.out"

######################################
# make image related
######################################
alias make1="make BRCM_MAX_JOBS=1"
alias makeu="make userspace"
alias makeb="make buildimage"


#chengyi personal alias
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
alias histg="history | grep"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
extract() {
if [ -f $1 ] ; then
case $1 in
*.tar.bz2) tar xjf $1 ;;
*.tar.gz) tar xzf $1 ;;
*.bz2) bunzip2 $1 ;;
*.rar) unrar e $1 ;;
*.gz) gunzip $1 ;;
*.tar) tar xf $1 ;;
*.tbz2) tar xjf $1 ;;
*.tgz) tar xzf $1 ;;
*.zip) unzip $1 ;;
*.Z) uncompress $1 ;;
*.7z) 7z x $1 ;;
*) echo "'$1' cannot be extracted via extract()" ;;
esac
else
echo "'$1' is not a valid file"
fi
}

#System info
alias cmount="mount | column -t"
sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"
alias meminfo='free -m -l -t'
alias ps?="ps aux | grep"
alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"

#Network
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
alias listen="lsof -P -i -n"
alias port='netstat -tulanp'

#make terminal shoter and show git branch
## Parses out the branch name from .git/HEAD:
find_git_branch () {
    local dir=. head
    until [ "$dir" -ef / ]; do
        if [ -f "$dir/.git/HEAD" ]; then
            head=$(< "$dir/.git/HEAD")
            if [[ $head = ref:\ refs/heads/* ]]; then
                git_branch=" → ${head#*/*/}"
            elif [[ $head != '' ]]; then
                git_branch=" → (detached)"
            else
                git_branch=" → (unknow)"
            fi
            return
        fi
        dir="../$dir"
    done
    git_branch=''
}
# Here is bash color codes you can use
  black=$'\[\e[1;30m\]'
    red=$'\[\e[1;31m\]'
  green=$'\[\e[1;32m\]'
 yellow=$'\[\e[1;33m\]'
   blue=$'\[\e[1;34m\]'
magenta=$'\[\e[1;35m\]'
   cyan=$'\[\e[1;36m\]'
  white=$'\[\e[1;37m\]'
 normal=$'\[\e[m\]'

PROMPT_COMMAND="find_git_branch;$PROMPT_COMMAND"
export PS1="$white[$magenta\u$white@$green\h$white:$cyan\W$yellow\$git_branch$white]\$ $normal"

#enable python plugin thefuck
# eval $(thefuck --alias)

#for ack-grep tool
alias ack="ack-grep"

#for dstat tool
alias dstat="dstat -cdlmnpsy"

#force tmux support 256 color
alias  tmux="tmux -2"

#ajoke for java code complete
export AJOKE_DIR=~/code/ajoke/
export export PATH=$AJOKE_DIR/bin:$PATH
export PERL5LIB="$AJOKE_DIR/etc/perl:$PERL5LIB";
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/android-studio/bin:/home/chengyi/code/Android/Sdk/ndk-bundle/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin:/home/chengyi/code/Android/Sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin"
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-android-
export TARGET_PREBUILT_KERNEL=/home/chengyi/code/android_kernel/msm/arch/arm64/boot/Image.gz-dtb

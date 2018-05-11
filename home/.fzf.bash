# Setup fzf
# ---------
if [[ ! "$PATH" == */home/chengyi/.fzf/bin* ]]; then
  export PATH="$PATH:/home/chengyi/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/chengyi/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/chengyi/.fzf/shell/key-bindings.bash"


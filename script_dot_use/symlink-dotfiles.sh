#/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
echo $SCRIPTPATH

dir=$SCRIPTPATH/..
# old dotfiles backup directory
olddir=$SCRIPTPATH/../dotfiles_old          
# list of files/folders to symlink in homedir
files="bashrc script zshrc tmux.conf ycm_extra_conf.py gitconfig vimrc.local vimrc.before.local vimrc.bundles.local"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in current directory"
mkdir -p $olddir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Backup ~/.$file from ~ to $olddir"
    mv ~/.$file $olddir 2>/dev/null
    echo "Creating symlink to $file in home directory."
    ln -s $dir/config/$file ~/.$file
done

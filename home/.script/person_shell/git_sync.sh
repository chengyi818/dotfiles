#!/bin/bash

directory_list=(
'/home/chengyi/code/github/linux_kernel_all'
'/home/chengyi/code/github/kata'
'/home/chengyi/.homesick/repos/dotfiles'
'/home/chengyi/code/github/Fat-Cheng-s-xv6-journey'
'/home/chengyi/code/github/my_xv6'
)

#check the working_directory clean or not?
function search_status()
{
    searchresult=$(git status|grep "clean")
    if [ -z "${searchresult}" ]; then
        echo "your working branch is not clean,are you sure to continue?(y/n)"
        read userbool
        if [ ${userbool} != 'y' ]; then
            exit
        fi
    fi

}

function sync_repo()
{

    echo "enter $1"
    cd $1
    search_status
    git pull
}

### main
for direc in ${directory_list[@]}
do
    sync_repo $direc
done

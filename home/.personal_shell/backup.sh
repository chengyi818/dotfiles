#!/bin/sh
# sudo rsync -avzP --delete --progress / /home/chengyi/backup/backup_mobile --exclude-from=/home/chengyi/personal_shell/exclude.list
tar cvpzf backup.tgz --exclude-from=/home/chengyi/personal_shell/exclude.list --exclude=/backup.tgz /

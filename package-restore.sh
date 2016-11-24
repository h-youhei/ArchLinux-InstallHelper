#!/bin/sh

script_path=`readlink -f $0`
script_dir=`dirname $script_path`
cd $script_dir/backup

pacman -S `cat main.plst`
aura -A `cat aur.plst`

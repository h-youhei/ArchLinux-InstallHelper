#!/bin/sh

script_path=`readlink -f $0`
script_dir=`dirname $script_path`

cd $script_dir/backup

#get package list
pacman -Qqe > all.plst
pacman -Qqg | grep '^base \|^base-devel ' | awk '{print $2}' > base.plst
pacman -Qqg | grep '^user ' | awk '{print $2}' > abs.plst
pacman -Qqm > aur.plst

#exclude base, aur, abs packages from main list
cat all.plst | grep -v "`cat base.plst`" | grep -v "`cat aur.plst`" | grep -v "`cat abs.plst`" > main.plst

rm base.plst all.plst

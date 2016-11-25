#!/bin/sh

script_path=`readlink -f $0`
script_dir=`dirname $script_path`
cd $script_dir

cp -r loader /boot

cd /boot/loader/entries
partition=`findmnt -l | grep '/ ' | awk '{print $2}'`
uuid=`blkid | grep $partition | awk '{print $6}' | sed 's/"//g'`
echo "options root=$uuid rw" | tee -a arch.conf >> arch-lts.conf

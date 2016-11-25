#!/bin/sh

script_path=`readlink -f $0`
script_dir=`dirname $script_path`

ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
hwclock --systohc
printf "en_US.UTF-8\nja_JP.UTF-8\n" >> /etc/locale.gen
locale-gen

$script_dir/boot-setup.sh

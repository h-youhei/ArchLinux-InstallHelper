#!/bin/sh

pkgname=yay-bin
curl -L -O https://aur.archlinux.org/cgit/aur.git/snapshot/$pkgname.tar.gz
tar -xvf $pkgname.tar.gz
cd $pkgname
makepkg -sci
ret=$?
cd ..
test $ret -eq 0 && rm -r $pkgname.tar.gz $pkgname

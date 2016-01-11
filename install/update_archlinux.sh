#!/bin/sh
yaourt -Suya
# if you don't use AUR/yaourt use
# pacman -Suy

# cleanup
# https://wiki.archlinux.org/index.php/pacman#Cleaning_the_package_cache
paccache -r

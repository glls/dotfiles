# TODO
---
create a .gitignore, also include [credential filtering](https://github.com/ChALkeR/notes/blob/master/Do-not-underestimate-credentials-leaks.md)

_start the ssh-agent in the background_

`eval "$(ssh-agent -s)"`

ssh-add -l

### installation [update & symlink to ~]
backup replaced files

### uninstall


support zsh and bash (and windows?)

add local/ dir ?

check for running OS

split linux/mac/windows specific files

add git prompt bash/zsh

mac keyboard hacks

# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) [ubuntu]
# /etc/environment or /etc/profile

application installation scripts

cheatsheet / README / links info

* check in okeanos VMs, iMac
* https://github.com/thanpolas/Practice
* https://github.com/holman/dotfiles
* http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/
* https://github.com/jonathansick/dotfiles

echo $SHELL
echo $0

# Check for super user
if [ $UID -ne 0 ]; then
echo Non root user. Please run as root.
else
echo "Root user"
fi

https://www.packtpub.com/packtlib/book/All%20Books/9781849513760/1/ch01lvl1sec22/Comparisons%20and%20tests


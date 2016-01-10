*under heavy development*

# GL's dotfiles
dotfiles from scratch

[image placeholder]

## Features

## Installation
run bootstrap.sh

## Uninstall
run debootstrap.sh to remove .dotfiles directory and restore old files

## Folder structure
|directory|function|
|:--------|:-------|
|backup|used for backup of replaced files during installation
|bash| bash specific files
|bin| commands
|shell | files for all supported shells
|zsh| zsh specific files
|tmp| will be removed
|install| installation and update scripts

keep only README, LICENSE and .gitignore on root folder
<br>?maybe install/uninstall too?

## shell specific
choose bash/zsh from command line option, default bash

## platform specific
| file | platform | function |
|:-----|:---------|:---------|
|alias.osx|osx|mac aliases
|alias.linux|linux|linux aliases


### local files
| file | function | config |
|:-----|:---------|:-------|
|~/.gitconfig.local| git configuration | gitconfig


## Thanks to

* [GitHub ❤ ~/](https://dotfiles.github.io/)
* [Konstantinos Margaritis](https://margaritis.org/) and [his dotfiles repository](https://github.com/margaritis/dotfiles)
* [Mathias Bynens](https://mathiasbynens.be/) [amazing collection of dotfiles](https://github.com/mathiasbynens/dotfiles)
* [Arch Linux](https://www.archlinux.org/) Wiki documentation about [dotfiles](https://wiki.archlinux.org/index.php/Dotfiles)
* https://github.com/webpro/awesome-dotfiles
* [holman does dotfiles](https://github.com/holman/dotfiles)
* http://chr4.org/blog/2014/09/10/conf-dot-d-like-directories-for-zsh-slash-bash-dotfiles/
* https://github.com/thiagowfx/dotfiles
* https://github.com/robbyrussell/oh-my-zsh

...and many others

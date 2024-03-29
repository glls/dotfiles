# GL's dotfiles
dotfiles from scratch

![GL](https://www.gravatar.com/avatar/5d1bf77dd8f1e428f8a77078cb6a608e)

## Features
* Create (local) backup of replaced files
* OS/Arch/Host specific scripts/configuration
* Upgrade via git

## Installation
Run `bootstrap.sh`

## Uninstall
Run `debootstrap.sh` to remove .dotfiles directory and restore files from backup folder

## Folder structure
|directory|function|
|:--------|:-------|
|backup|used for backup of replaced files during installation
|bin| commands
|shell | files for all supported shells
|config| various config files
|install| installation and update scripts
|tmp| will be removed

Keep only README, LICENSE and .gitignore on root folder

## Shell options
Choose bash or zsh, default is bash

## Platform options
| file | platform | function |
|:-----|:---------|:---------|
|alias.osx|osx|mac aliases
|alias.linux|linux|linux aliases


## Local files
| file | function | config |
|:-----|:---------|:-------|
|~/.gitconfig.local| git configuration | gitconfig

## Tested on 
- [x] Linux (Arch/Ubuntu)
- [ ] macOS
- [ ] WSL2

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

#!/bin/sh

# dotfiles uninstall script

DOTDIR=$HOME/dotfiles_test

# remove directory
#  restore backed up files from backup
BACKUPDIR=$DOTDIR/backup

# Unlink the dotfiles in $HOME that were installed by bootstrap.sh
rm -f $HOME/.zshrc
rm -f $HOME/.gitconfig
#rm -f $HOME/.tmux.conf

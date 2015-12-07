#!/bin/bash

# dotfiles installation script
#
# get the started from:
# curl -L https://raw.github.com/glls/dotfiles/master/bootstrap.sh | bash

DOTDIR=$HOME/dotfiles_test

if [ -d $DOTDIR ]; then
    echo "glls/dotfiles seems to be installed already."
    exit 1;
fi

# Get it
git clone https://github.com/glls/dotfiles.git $DOTDIR
cd $DOTDIR
git submodule update --init

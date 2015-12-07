#!/bin/sh

# dotfiles installation script
#
# get started from:
# curl -L https://raw.github.com/glls/dotfiles/master/bootstrap.sh | bash

DOTDIR=$HOME/dotfiles_test

if [ -d $DOTDIR ]; then
    echo "dotfiles seem to be already installed"
    exit 1;
fi

# Get it // put your repo here
git clone https://github.com/glls/dotfiles.git $DOTDIR
cd $DOTDIR

backEm() {
  # backup files that will be overwritten
}

copEm() {
  #rsync files
}

# Link dotfiles that need to be in $HOME
function linkEm() {
  ln -Ffs $DOTDIR/zshrc $HOME/.zshrc
  ln -Ffs $DOTDIR/gitconfig $HOME/.gitconfig
}

main() {
  printf "hello world\n"

  # if $TERM == zsh source $HOME/.zprofile
  # 
  # elseif $TERM == /bin/bash  source $HOME/.bash_profile
  #
  # first source exports then path

  # if $OSTYPE == linux-gnu
  # else if $OSTYPE == darwin15
}

main

# change to #!/bin/sh ?? check

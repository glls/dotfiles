#!/bin/sh

# dotfiles installation script
#
# get started :
# curl -L https://raw.github.com/glls/dotfiles/master/bootstrap.sh | bash

#############################
# Config                    #
#############################

# dotfiles repository
DOTREPO=https://github.com/glls/dotfiles.git
# dotfiles install directory
DOTDIR=$HOME/dotfiles_test

#############################
# Do not edit               #
#############################

function check() {
  if [ -d $DOTDIR ]; then
    printf "dotfiles seem to be already installed, exiting.\n"
    exit 1;
  fi
}

function backEm() {
  # backup files that will be overwritten
  # ignore backup files in git
  # tar.gz and save with machine name
  echo 1
}

function copEm() {
  #rsync files
  rsync
}

# Link dotfiles that need to be in $HOME
function linkEm() {
  # zsh
  ln -Ffs $DOTDIR/zsh/zshrc $HOME/.zshrc
  # bash
  ln -Ffs $DOTDIR/bash/bash_profile $HOME/.bash_profile
  ln -Ffs $DOTDIR/bash/bashrc $HOME/.bashrc
  ln -Ffs $DOTDIR/bash/bash_prompt $HOME/.bash_prompt
  # git
  ln -Ffs $DOTDIR/gitconfig $HOME/.gitconfig
  ln -Ffs $DOTDIR/shell/editorconfig $HOME/.editorconfig
}

function runEm() {
  # run/source filesm according to current shell
  for file in $DOTDIR/.{path,bash_prompt,export,alias,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
  done;
  unset file;
}

function info() {
  printf "Running dotfiles bootstrap...\n"
  printf "OS:\t$OSTYPE\n"
  printf "Term:\t$TERM\n"
  printf "Shell:\t$SHELL\n"
  printf "User:\t$USER\n"
  printf "\nWill install dotfiles in $DOTDIR from $DOTREPO\n"
}

function main() {
  info
  check
  # Get it // put your repo here
  git clone $DOTREPO $DOTDIR
  cd $DOTDIR
  backEm(arg)


  # command line argument
  # -f force install

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

#!/bin/sh

# dotfiles installation script
#
# get started :
# curl -L https://raw.github.com/glls/dotfiles/master/bootstrap.sh | bash

#DEBUG
#set -x

#############################
# Configuration
#
# dotfiles repository
DOTREPO="https://github.com/glls/dotfiles.git"
# dotfiles install directory
DOTDIR="$HOME/dotfiles_test"
# get distribution, version, architecture
# with lsb_release, /etc/issue, uname, $OSTYPE, hostname
DOTDISTRO="$OSTYPE Archlinux"
#DOTDIST="linux-gnu Ubuntu 14.04"
# choose bash, zsh from command line, default bash
DOTSHELL="bash"

# get machine name
DOTMACHINE="$(hostname)"
#
# End of Configuration
#############################

#
# copy a file if it exists
#
function copy_file() {
  if [ -f "$1" ]; then
    echo "file $1 copied"
    cp "$1" "$2"
  else
    echo "file $1 not found"
  fi
}

#
# backup files to directory in $DOTDIR/backup/ per machine and datetime
#
function backup_files() {
  # backup files that will be overwritten
  NOW=$(date +"%y%m%d.%H%M%S")
  backup_dir=$DOTDIR/backup/$DOTMACHINE.$NOW/
  printf "backing up files to $backup_dir\n"
  mkdir $backup_dir
  while read f; do
    copy_file $HOME/$f $backup_dir
  done <$DOTDIR/backup/filelist
  ret=$?
  unset -v backup_dir NOW
  return $ret
}

#
#
#
function copyEm() {
  #rsync files
  rsync
}

#
# link dotfiles that need to be in $HOME
#
function linkEm() {
  # bash
  ln -Ffs $DOTDIR/bash/bash_profile $HOME/.bash_profile
  ln -Ffs $DOTDIR/bash/bashrc $HOME/.bashrc
  ln -Ffs $DOTDIR/bash/bash_prompt $HOME/.bash_prompt
  # zsh
  ln -Ffs $DOTDIR/zsh/zshrc $HOME/.zshrc
  # git
  ln -Ffs $DOTDIR/gitconfig $HOME/.gitconfig
  ln -Ffs $DOTDIR/gitconfig $HOME/.gitignore

  ln -Ffs $DOTDIR/shell/editorconfig $HOME/.editorconfig
}

#
#
#
function runEm() {
  # run/source files according to current shell
  for file in $DOTDIR/.{path,bash_prompt,export,alias,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
  done;
  unset file;
}

#
# print configuration
#
function print_info() {
  printf "Running dotfiles bootstrap...\n\n"
  printf "OS:\t$OSTYPE\n"
  printf "Term:\t$TERM\n"
  printf "Shell:\t$SHELL\n"
  printf "User:\t$USER\n"
  printf "\nDOTDIR:\t\t$DOTDIR\n"
  printf "DOTREPO:\t$DOTREPO\n"
  printf "DOTDISTRO:\t$DOTDISTRO\n"
  printf "DOTSHELL:\t$DOTSHELL\n"
  printf "\nWill install dotfiles in $DOTDIR from $DOTREPO\n\n"
}

#
# main bootstrap function
#
function main_bootstrap() {

  print_info

  # command line argument
  # -f force install

  # if [ -d $DOTDIR ]; then
  #   printf "dotfiles seem to be already installed, exiting.\n"
  #   return 2;
  # fi

  backup_files #check if error returned and exit
  ret=$?
  if [ $ret -gt 0 ]; then
    return $ret
  fi

  # Get it // put your repo here
  if [ ! -d $DOTDIR ]; then
    git clone $DOTREPO $DOTDIR
    if [ $ret -gt 0 ]; then
      return $ret
    fi
  else
    # update from git
    cd $DOTDIR
    git pull
    if [ $ret -gt 0 ]; then
      return $ret
    fi
  fi


  # if $TERM == zsh source $HOME/.zprofile
  #
  # elseif $TERM == /bin/bash  source $HOME/.bash_profile
  #
  # first source exports then path

  echo "DEBUG1 END"

  return 0
}

main_bootstrap
ret=$?

# unset functions used in bootstrap
unset -f copy_file backup_files print_info main_bootstrap
unset -v DOTREPO DOTDIR DOTDISTRO DOTSHELL DOTMACHINE

exit $ret

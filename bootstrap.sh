#!/bin/bash
# dotfiles installation script
#
# get started :
# curl -L https://raw.github.com/glls/dotfiles/master/bootstrap.sh | bash
#
# DEBUG
#set -x
#
#############################
# Configuration
#
# dotfiles repository
DOTREPO="https://github.com/glls/dotfiles.git"
# dotfiles install directory
DOTDIR="$HOME/dotfiles_test"
# get distribution, version, architecture
# $OSTYPE
# linux: lsb_release, /etc/issue, uname
# osx: w_vers -productVersion
DOTDISTRO="$OSTYPE Archlinux"
#DOTDIST="linux-gnu Ubuntu 14.04"
# choose bash, zsh from command line, default bash
DOTSHELL="bash"
# get machine name
DOTMACHINE="$(hostname)"
#
# End of Configuration
#############################

# init colors
reset="\e[0m";
green="\e[1;32m";
red="\e[1;31m";
white="\e[1;37m";

#
# copy a file if it exists
#
function copy_file {
  if [ -f "$1" ]; then
    printf "${green}$1 copied\n"
    cp "$1" "$2"
  else
    printf "${red}$1 not found\n"
  fi
}

#
# backup files to directory in $DOTDIR/backup/ per machine and datetime
#
function backup_files {
  # backup files that will be overwritten
  NOW=$(date +"%y%m%d.%H%M%S")
  backup_dir=$DOTDIR/backup/$DOTMACHINE.$NOW/
  printf "Backing up files to $backup_dir\n"
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
function copyEm {
  #rsync files
  rsync
}

#
# link dotfiles that need to be in $HOME
#
function linkEm {
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
function runEm {
  # if $TERM == zsh source $HOME/.zprofile
  #
  # elseif $TERM == /bin/bash  source $HOME/.bash_profile

  # run/source files according to current shell
  for file in $DOTDIR/.{path,bash_prompt,export,alias,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
  done;
  unset file;
}

#
# print configuration
#
function print_info {
  printf "${white}Running dotfiles bootstrap...${reset}\n"
  printf "Will install dotfiles in ${white}$DOTDIR${reset} from ${white}$DOTREPO${reset}\n\n"
}

#
# main bootstrap function
#
function main_bootstrap {

  print_info

  if [ ! -d $DOTDIR ]; then
    printf "Creating dotfiles directory\n"
    git clone $DOTREPO $DOTDIR
    ret=$?
    if [ $ret -gt 0 ]; then
      return $ret
    fi
  else
    # update from git
    printf "dotfiles seem to be already installed, updating\n"
    cd $DOTDIR
    git pull
    ret=$?
    if [ $ret -gt 0 ]; then
      return $ret
    fi
  fi

  backup_files #check if error returned and exit
  ret=$?
  if [ $ret -gt 0 ]; then
    return $ret
  fi

  printf "${green}DEBUG1${reset} END\n"

  return 0
}

main_bootstrap
ret=$?

# unset functions used in bootstrap
unset -f copy_file backup_files print_info main_bootstrap
unset -v DOTREPO DOTDIR DOTDISTRO DOTSHELL DOTMACHINE red green reset white

exit $ret

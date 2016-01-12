#!/bin/bash
# GL's dotfiles installation script
#
# get started :
# curl -L https://raw.github.com/glls/dotfiles/master/bootstrap.sh | bash
#
# enable DEBUG
# set -x
#
#############################
# Configuration
#
# dotfiles repository
DOTREPO="https://github.com/glls/dotfiles.git"
# dotfiles install directory, could be "$HOME/.dotfiles"
DOTDIR="$HOME/dotfiles_test"
# install for shell {bash, zsh, all}
DOTSHELL="bash"
#
# End of Configuration
#############################

if [[ "$DOTSHELL" == "auto" ]]; then
  DOTSHELL=$0
fi
# if shell not bash or zsh exit "Unsupported shell"

# get machine name
DOTMACHINE="$(hostname)"

# get distribution, version, architecture
# osx: w_vers -productVersion
DOTDISTRO="$(lsb_release -si)"
# if lsb_release found ^^
# if $OSTYPE==darwin DOTDISTRO=`w_vers -productVersion`
# elif $OSTYPE==linux-gnu DOTDISTRO=`cat /etc/issue`

# init colors
reset="\e[0m";
bold="\e[1m";
green="\e[1;32m";
red="\e[1;31m";

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
  printf "\nBacking up files to ${bold}$backup_dir${reset}\n"
  mkdir $backup_dir
  while read f; do
    copy_file $HOME/$f $backup_dir
  done <$DOTDIR/backup/filelist
  ret=$?
  unset -v backup_dir NOW
  return $ret
}

#
# link dotfiles that need to be in $HOME
#
function link_files {
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
  # $HOME/bin
}

#
# evaluate and load script files
#
function source_files {
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
  printf "${bold}Running dotfiles bootstrap...${reset}\n"
  printf "Installing on $DOTMACHINE ($DOTDISTRO) for $DOTSHELL\n"
  printf "Will install dotfiles in ${bold}$DOTDIR${reset} from ${bold}$DOTREPO${reset}\n\n"
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

  #link_files

  #copy files from ./config

  #source_files

  printf "${green}DEBUG1${reset} END\n"

  return 0
}

main_bootstrap
ret=$?

# unset functions used in bootstrap
unset -f copy_file backup_files link_files source_files print_info main_bootstrap
unset -v DOTREPO DOTDIR DOTDISTRO DOTSHELL DOTMACHINE red green reset bold

exit $ret

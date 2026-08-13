#!/bin/bash

# Run from the repo root regardless of where this script is invoked from
cd "$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)" || exit 1

#Copy basics
  echo "Copying .zshrc"
  cp .zshrc $HOME

  echo "Installing amix/vimrc"
  if [ ! -d "$HOME/.vim_runtime" ]; then
    git clone --depth=1 https://github.com/amix/vimrc.git "$HOME/.vim_runtime"
    sh "$HOME/.vim_runtime/install_awesome_vimrc.sh"
  fi
  ln -sf "$(pwd)/my_configs.vim" "$HOME/.vim_runtime/my_configs.vim"

  echo "Copying .bash_aliases"
  cp local/bash/.bash_aliases $HOME

  echo "Copying .bashrc"
  cp local/bash/.bashrc $HOME

  echo "Copying .tmux.conf"
  cp .tmux.conf $HOME

#Copy bash correct bash profile based on OS
  case $( uname -s ) in
  Linux)
    echo "Copying Linux Bash Profile"
    cp local/bash/.bash_profile-ubuntu "$HOME/.bash_profile";;
  *)
    echo "Copying Mac Bash Profile"
    cp local/bash/.bash_profile-mac "$HOME/.bash_profile";;
  esac

#Copy .gitconfig
  echo "Copying .gitconfig"
  cp .gitconfig $HOME
  read -p "Full Name: " full_name
  read -p "Github Login(email): " git_email
  git config --global user.name "$full_name"
  git config --global user.email $git_email
  git config --global core.editor "vim"

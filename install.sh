#!/bin/bash

#Copy basics
  # echo "Copying .zshrc"
  # cp .zshrc $HOME

  # echo "Copying .powerlevel9k"
  # cp .powerlevel9k $HOME

  echo "Copying .vimrc"
  ln -s $dotfiles_root/vimrc ~/.vim/vimrc

  # echo "Copying .bash_aliases"
  # cp bash/.bash_aliases $HOME

  echo "Copying .bashrc"
  cp bash/.bashrc $HOME
  ln -s $dotfiles_root/bashrc ~/.bash/bashrc

  # echo "Copying .tmux.conf"
  # cp .tmux.conf $HOME

#Copy bash correct bash profile based on OS
  # case $( uname -s ) in
  # Linux)
  #   echo "Copying Linux Bash Profile"
  #   cp bash/.bash_profile-ubuntu "$HOME/.bash_profile";;
  # *)
  #   echo "Copying Mac Bash Profile"
  #   cp bash/.bash_profile-mac "$HOME/.bash_profile";;
  # esac

#Copy .gitconfig
  # echo "Copying .gitconfig"
  # cp .gitconfig $HOME
  # read -p "Full Name: " full_name
  # read -p "Github Login(email): " git_email
  # git config --global user.name "$full_name"
  # git config --global user.email $git_email
  # git config --global core.editor "vim"

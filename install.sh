#!/bin/bash

#Copy basics
  echo "Copying .vimrc"
  cp .vimrc $HOME
  echo "Copying .bash_aliases"
  cp bash/.bash_aliases $HOME
  echo "Copying .bashrc"
  cp bash/.bashrc $HOME
  echo "Copying .tmux.conf"
  cp .tmux.conf $HOME

#Copy bash correct bash profile based on OS
  case $( uname -s ) in
  Linux)
    echo "Copying Linux Bash Profile"
    cp bash/.bash_profile-ubuntu "$HOME/.bash_profile";;
  *)
    echo "Copying Mac Bash Profile"
    cp bash/.bash_profile-mac "$HOME/.bash_profile";;
  esac

#Copy .gitconfig
  echo "Copying .gitconfig"
  cp .gitconfig $HOME
  read -p "Full Name: " full_name
  read -p "Github Login(email): " git_email
  git config --global user.name "$full_name"
  git config --global user.email $git_email

#Create pianobar conf
  read -p "Pandora Login: " pandora_login
  read -s -p "Pandora Password: " pandora_password
  echo

  tls_fingerprint=$(openssl s_client -connect tuner.pandora.com:443 < /dev/null 2> /dev/null | \
    openssl x509 -noout -fingerprint | tr -d ':' | cut -d'=' -f2)

  echo "Creating .config/pianobar/config"
  mkdir "$HOME/.config/pianobar"
  pianobar_config_path="$HOME/.config/pianobar/config"
  touch $pianobar_config_path
  echo "tls_fingerprint = $tls_fingerprint" > $pianobar_config_path
  echo "autostart_station = 73789290590671043" >> $pianobar_config_path
  echo "user = $pandora_login" >> $pianobar_config_path
  echo "password = $pandora_password" >> $pianobar_config_path

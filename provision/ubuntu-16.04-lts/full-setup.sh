#!/bin/bash

if [ ! $(which git) ] || [ ! $(which stow) ]; then
  sudo apt install -y git stow
fi

# Install i3 if it doesn't already exist
if [ ! $(which i3) ]; then
  install-i3-gaps.sh
else
  echo "i3 is already installed."
fi

# Install i3 utilities if they don't already exist
if [ ! $(which i3lock) ]; then
  sudo apt install -y i3blocks i3lock
fi

# Install rofi, feh and compton unless already installed
if [ ! $(which rofi) ]; then
  sudo apt install -y rofi feh compton
fi

# Mass run stow on our dotfiles
cd ~/dotfiles
./stow-init.sh

# Install zsh
~/dotfiles/provision/ubuntu-16.04-lts/install-zsh.sh

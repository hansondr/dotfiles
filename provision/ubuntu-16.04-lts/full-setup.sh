#!/bin/bash

# Install vim if it doesn't already exist
command -v vim >/dev/null 2>&1 || { sudo apt install -y vim; }

# Install i3 utilities if they don't already exist
command -v i3lock >/dev/null 2>&1 || { sudo apt install -y i3blocks i3lock; }

# Install rofi, feh and compton unless already installed
command -v rofi >/dev/null 2>&1 || { sudo apt install -y feh rofi compton; }

# Mass run stow on our dotfiles
cd ~/dotfiles
./stow-init.sh

# Install zsh
~/dotfiles/provision/ubuntu-16.04-lts/install-zsh.sh

# Install i3 if it doesn't already exist
if [ ! -d "/tmp/i3-gaps" ]; then
  install-i3-gaps.sh
else
  echo "i3 is already installed."
fi

#!/bin/bash

if [ ! -e $(which zsh) ]; then
  sudo apt install zsh
  sudo chsh -s "$(which zsh)" "${USER}"
else
  echo "zsh already installed.";
fi

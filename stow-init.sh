#!/bin/bash

command -v stow >/dev/null 2>&1 || { sudo apt install -y stow; }

stow fonts
stow git
stow i3
stow vim
stow x
stow zsh
stow compton
stow dunst
stow bin
stow browser
stow rbenv

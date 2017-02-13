#!/bin/bash

command -v zsh >/dev/null 2>&1 || {
  sudo apt install -y zsh;
  sudo chsh -s "$(which zsh)" "${USER}";
  echo >&2 "zsh set.";
}

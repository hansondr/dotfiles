#!/bin/bash

command -v display >/dev/null 2>&1 || { sudo apt install -y imagemagick; }
command -v compton >/dev/null 2>&1 || { sudo apt install -y compton; }
command -v dunst >/dev/null 2>&1 || { sudo apt install -y dunst; }
command -v urxvtd >/dev/null 2>&1 || { sudo apt install -y rxvt-unicode fonts-hack-ttf; }

command -v sassc >/dev/null 2>&1 || {
  sudo apt install -y build-essential;
  cd /opt;
  sudo git clone https://github.com/sass/libsass.git;
  sudo git clone https://github.com/sass/sassc.git libsass/sassc;
  echo 'SASS_LIBSASS_PATH="/opt/libsass"' | sudo tee -a /etc/environment;
  source /etc/environment;
  echo $SASS_LIBSASS_PATH
  cd libsass/sassc;
  sudo make;
  sudo ln -sn /opt/libsass/sassc/bin/sassc /usr/local/bin/;
}

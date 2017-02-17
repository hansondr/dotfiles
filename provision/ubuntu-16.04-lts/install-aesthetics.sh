#!/bin/bash

command -v display >/dev/null 2>&1 || { sudo apt install -y imagemagick; }
command -v compton >/dev/null 2>&1 || { sudo apt install -y compton; }
command -v dunst >/dev/null 2>&1 || { sudo apt install -y dunst; }
command -v urxvtd >/dev/null 2>&1 || { sudo apt install -y rxvt-unicode fonts-hack-ttf; }

# Install sassc for custom browser home page SASS -> CSS
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

# Install Arc Theme
if [ ! -f /etc/apt/sources.list.d/arc-theme.list ]; then
  sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/arc-theme.list"
  wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key
  sudo apt-key add - < Release.key
  sudo apt update
  sudo apt install -y arc-theme
  rm Release.key
fi

# Install prerequisites for blurred i3lock screen
command -v xautolock >/dev/null 2>&1 || { sudo apt install -y i3lock scrot xautolock; }

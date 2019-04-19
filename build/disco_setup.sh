#!/bin/bash

echo
echo 'Setup Disco Dingo (19.xx) Server install'
echo
read -p 'Would you like to continue? ' -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

echo '[apt] installing Wayland and dependencies...'
sudo apt install -y libgles2-mesa-dev libdrm2 libdrm-dev libegl1-mesa-dev xwayland


echo '[apt] installing Wlc dependencies...'
sudo apt install -y cmake build-essential libinput10 libinput-dev libxkbcommon0 libxkbcommon-dev libudev-dev libxcb-image0 libxcb-image0-dev libxcb-composite0 libxcb-composite0-dev libxcb-xkb1 libxcb-xkb-dev libgbm1 libgbm-dev libdbus-1-dev libsystemd-dev zlib1g-dev libpixman-1-dev libxcb-ewmh-dev wayland-protocols git


echo '[git] building and installing Wlc...'
if [ ! -d ~/src ]; then
  mkdir ~/src
fi
cd ~/src
git clone https://github.com/Cloudef/wlc.git
cd wlc
mkdir target
cd target
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DSOURCE_WLPROTO=ON ..
make
sudo make install


echo '[apt] installing Sway dependencies...'
sudo apt install -y meson libelogind-dev libpcre3 libpcre3-dev libcairo2
libcairo2-dev libpango1.0-0 libpango1.0-dev asciidoc libcap-dev xsltproc
libpam0g-dev libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-dev


echo '[apt] installing build tools...'
sudo apt install -y autoconf automake libtool


echo '[git] building and installing libjson-c (Sway requires >= 0.13 and disco apt only includes version 0.12x)'
cd ~/src
git clone https://github.com/json-c/json-c.git
cd json-c
git checkout json-c-0.13
sh autogen.sh
./configure
make
sudo make install


echo '[git] install wlroots (Sway 1.0 recommends version 0.5.0)...'
cd ~/src
git clone https://github.com/swaywm/wlroots.git
cd wlroots
git checkout 0.5.0
meson build
ninja -C build
sudo ninja -C build install


echo '[git] install Sway 1.0'
cd ~/src
git clone https://github.com/swaywm/sway.git
cd sway
git checkout 1.0
meson build
ninja -C build
sudo ninja -C build install


echo
echo 'Setup complete!'
echo


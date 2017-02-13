#!/bin/bash

# Dependencies
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev \
  libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
  libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev \
  libtool

echo "building xcb-util-xrm..."
if [ -d "/tmp/xcb-util-xrm" ]; then rm -rf /tmp/xcb-util-xrm; fi
git clone https://github.com/Airblader/xcb-util-xrm /tmp/xcb-util-xrm
cd /tmp/xcb-util-xrm
git submodule update --init
./autogen.sh --prefix=/usr
make
sudo make install
echo "installation of xcb-util-xrm completed."

echo "i3-gaps dependencies installed.  Downloading i3-gaps..."
if [ -d "/tmp/i3-gaps" ]; then rm -rf /tmp/i3-gaps; fi
git clone -b gaps https://www.github.com/Airblader/i3 /tmp/i3-gaps
cd /tmp/i3-gaps

echo "i3-gaps compiling..."
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
echo "i3-gaps installing..."
sudo make install

echo "i3-gaps installation complete."
i3 --version

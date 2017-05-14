# dual monitor / work setup
#xrandr --output HDMI1 --mode 1920x1080 --output HDMI2 --mode 1920x1080 --right-of HDMI1
xrandr --dpi 192
#xrandr --output eDP-1 --scale 1.25x1.25
autocutsel &
compton &
dunst &
xrdb "$HOME/.Xresources"
#urxvtd -q -f &
wal -i $(< "${HOME}/.cache/wal/wal") -o "wal-set"
exec i3
xautolock -time 10 -locker blurloc

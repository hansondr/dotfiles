# dual monitor / work setup
xrandr --output HDMI1 --mode 1920x1080 --output HDMI2 --mode 1920x1080 --right-of HDMI1
dunst -conf "$HOME/.config/dunst/dunstrc" &
xrdb "$HOME/.Xresources"
set-wallpaper
exec i3

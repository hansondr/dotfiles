autocutsel &
compton &
dunst &
xrdb "$HOME/.Xresources"
urxvtd -q -f &
wal -i $(< "${HOME}/.cache/wal/wal") -o "wal-set"
exec i3

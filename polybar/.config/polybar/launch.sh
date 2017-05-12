#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch topbars for each monitor
MONITOR=HDMI1 polybar topbar &
MONITOR=HDMI2 polybar topbar &

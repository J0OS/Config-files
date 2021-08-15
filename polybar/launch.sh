#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Delete old easy command locations
rm /tmp/ipc-i3LVDS1-1
rm /tmp/ipc-i3LVDS1-2
rm /tmp/ipc-i3LVDS1-3
rm /tmp/ipc-i3VGA1-1

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
# and create easy command loactions
polybar i3LVDS1-1 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-i3LVDS1-1 &
polybar i3LVDS1-2 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-i3LVDS1-2 &
polybar i3LVDS1-3 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-i3LVDS1-3 &
polybar i3VGA1-1 &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-i3VGA1-1 &

##echo "cmd:hide" >/tmp/ipc-i3LVDS1-3 &
echo "Polybar launched..."

#!/usr/bin/env bash

if [ "$1" == "--window" ]; then
  maim --window $(xdotool getactivewindow) "/home/$USER/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
elif [ "$1" == "--select" ]; then
  maim --select "/home/$USER/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
else
  maim "/home/$USER/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"
fi

notify-send "Screenshot" "Screenshot saved in Pictures/Screenshots"

#! /bin/sh

chosen=$(printf "PowerOff\nRestart\nLock" | rofi -dmenu -i)

case "$chosen" in
"PowerOff") poweroff ;;
"Restart") reboot ;;
"Lock") slock ;;
*) exit 1 ;;
esac

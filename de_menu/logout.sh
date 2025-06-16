#!/usr/bin/env bash

. ~/.config/de_menu/config.sh

choice="$(printf "Lock Screen\nReboot\nShutdown" | $DMENU -p "Shutdown Menu:")" || exit 0
case $choice in
    "Lock Screen")
        osascript -e 'tell application "Finder" to sleep'
        ;;
    Restart)
        osascript -e 'tell app "System Events" to restart'
        ;;
    Shutdown)
        osascript -e 'tell app "System Events" to shut down'
        ;;
esac

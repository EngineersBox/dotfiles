#!/usr/bin/env bash

. $HOME/.config/dmenu/config.sh

options() {
    choice="$(printf "Lock Screen\nReboot\nShutdown" | $DMENU -p "Shutdown menu:")" || exit 0

    case $choice in
        "Lock Screen")
            osascript -e 'tell application "Finder" to sleep'
            ;;
        Reboot)
            osascript -e 'tell app "System Events" to restart'
            ;;
        Shutdown)
            osascript -e 'tell app "System Events" to shut down'
            ;;
    esac
}

options

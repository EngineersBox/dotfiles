#!/usr/bin/env bash

options() {
    choice="$(echo -e "Log Out\nLock Screen\nReboot\nShutdown" | tofi --fuzzy-match=true)" || exit 0
    case $choice in 
        "Log Out") sawmsg exit;;
        "Lock Screen") swaylock;;
        "Reboot") reboot;;
        "Shutdown") poweroff;;
    esac
}

options

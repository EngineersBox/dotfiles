#!/usr/bin/env sh

# get config
. $HOME/.config/dmenu/config.sh

# function to list all options
choice=$(printf "Lock Screen\nLogout\nReboot\nShutdown" | ${DMENU} "Shutdown menu:")

case $choice in
    "Lock Screen") osascript -e 'tell application "Finder" to sleep'
                   ;;
    "Logout") skhd -k "cmd + shift - q"
              ;;
    "Reboot") osascript -e 'tell app "System Events" to restart'
              ;;
    "Shutdown") osascript -e 'tell app "System Events" to shut down'
esac

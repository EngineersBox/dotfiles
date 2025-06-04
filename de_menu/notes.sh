#!/usr/bin/env bash

. ~/.config/de_menu/config.sh

notes_dir=$HOME/notes

function open_note() {
    open -na Ghostty --args -e "nvim $1"
}

function newnote() {
  name="$($DMENU --prompt_bg "#a3be8cff" -p "New note name: ")" || exit 0
  : "${name:=$(date +%F_%T | tr ':' '-')}"
  open_note "$notes_dir/$name.md"
}

choice=$(printf "New\n%s" "$(command ls -t1 "$notes_dir")" | $DMENU -p "Create/Edit Note:")
case $choice in
    New) newnote ;;
    *.md) open_note "$notes_dir/$choice" ;;
    *) exit ;;
esac

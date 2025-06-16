#!/usr/bin/env bash

. $HOME/.config/dmenu/config.sh

folder=$HOME/notes/

open_note() {
    open -na Ghostty --args -e "nvim $1"
}

newnote() {
  name="$(echo "" | $DMENU -sb "#a3be8c" -nf "#d8dee9" -p "New note name: " <&-)" || exit 0
  : "${name:=$(date +%F_%T | tr ':' '-')}"
  echo "NAME: $name"
  open_note "$folder$name.md"
}

selected() {
  choice=$(printf "New\n%s" "$(command ls -t1 "$folder")" | $DMENU -p "Choose note or create new: ")
  case $choice in
    New) newnote ;;
    *.md) open_note "$folder$choice" ;;
    *) exit ;;
  esac
}

selected

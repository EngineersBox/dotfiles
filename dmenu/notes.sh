#!/usr/bin/env bash

. $HOME/.config/dmenu/config.sh

folder=$HOME/notes/

open_ghostty() {
    open -na Ghostty --args -e "$1"
}

newnote () { \
  name="$(echo "" | ${DMENU} -sb "#a3be8c" -nf "#d8dee9" -p "Enter a name: " <&-)" || exit 0
  : "${name:=$(date +%F_%T | tr ':' '-')}"
  echo "NAME: $name"
  open_ghostty "nvim $folder$name.md"
}

selected () { \
  choice=$(echo -e "New\n$(command ls -t1 "$folder")" | ${DMENU} -l 5 -i -p "Choose note or create new: ")
  case $choice in
    New) newnote ;;
    *.md) open_ghostty "nvim $folder$choice" ;;
    *) exit ;;
  esac
}

selected

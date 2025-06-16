#!/usr/bin/env bash

. ~/.config/de_menu/config.sh

ls -d /Applications/*.app \
      /System/Applications/*.app \
      /System/Applications/Utilities/*.app \
      | sed -r 's/^.+\///' \
      | rev \
      | cut -c5- \
      | rev \
      | sort \
      | $DMENU \
      | xargs -I {} open -a  "{}"

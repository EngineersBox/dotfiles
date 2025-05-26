#!/usr/bin/env sh

. $HOME/.config/dmenu/config.sh

ls -d /Applications/*.app \
      /System/Applications/*.app \
      /Applications/Utilities/*.app \
      /System/Applications/Utilities/*.app \
      | sed -r 's/^.+\///' | rev | cut -c5- | rev | ${DMENU} | xargs -I {} open -a  "{}"

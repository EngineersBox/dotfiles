#!/usr/bin/env bash

. ~/.config/de_menu/config.sh

PIPE=/tmp/__de_menu_cyclic_pipe

rm -f $PIPE
mkfifo $PIPE
de_menu -l 20 \
        --lines_reverse \
        -f Monocraft \
        -p "Expression:" \
        --no_line_select \
        --filter "none" \
        --cyclic 0<$PIPE \
    | qalc -u8 \
        --color=0 \
        --set="mulsign 0" \
        --set="divsign 0" \
        --set="uni off" \
        --set="uniexp 0" \
        --set="basedisp 2" \
        --set="vspace off" \
        --set="edisp e" \
        --set="hextwos on" \
    | grep --line-buffered -vE "^>" 1>$PIPE
# NOTE: By default grep waits for a page (4KiB or 8iKB)
#       instead of per line. Using `--line-buffered` will
#       tell it to buffer per-line instead (i.e. ending
#       with a \n or \r depending on platform)
#       https://stackoverflow.com/a/49704817

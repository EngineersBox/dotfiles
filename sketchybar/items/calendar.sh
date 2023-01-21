#!/usr/bin/env sh

sketchybar  --add       item            calendar.date right                   \
            --set       calendar.date   icon=date                             \
                                        icon.font="$FONT:Black:10.0"          \
                                        icon.align=right                      \
                                        width=60                              \
                                        y_offset=6                            \
                                        update_freq=120                       \
                                        script="$PLUGIN_DIR/date.sh"          \
                                        click_script="$PLUGIN_DIR/zen.sh"     \
            --subscribe                 calendar.date system_woke             \
                                                                              \
            --add       item            calendar.clock right                  \
            --set       calendar.clock  icon=clock                            \
                                        icon.font="$FONT:Bold:10.0"           \
                                        icon.align=right                      \
                                        background.padding_right=-40          \
                                        background.padding_left=0             \
                                        y_offset=-10                          \
                                        update_freq=15                        \
                                        script="$PLUGIN_DIR/clock.sh"         \
                                        click_script="$PLUGIN_DIR/zen.sh"     \
                                        label.padding_left=-30                \
            --subscribe                 calendar.clock system_woke            
                                                                              


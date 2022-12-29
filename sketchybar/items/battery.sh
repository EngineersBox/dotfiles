#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

sketchybar --add alias "Control Centre,Battery" right                     \
		   --set "Control Centre,Battery" script="$PLUGIN_DIR/battery.sh" \
								  update_freq=10                          \
								  label.drawing=on                        \
								  background.padding_left=5               \
								  background.padding_right=5              \
								  background.color=0xff${NORD1:1}         \
								  background.corner_radius=9              \
								  background.height=26                    \
								  label.padding_left=-3                   \
								  label.padding_right=5                   \
								  icon.padding_left=-3                    \
								  icon.padding_right=-3

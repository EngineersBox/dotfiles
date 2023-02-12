#!/usr/bin/env sh

source "$HOME/.config/sketchybar/colors.sh"

sketchybar --add alias "Control Centre,Battery" right                     \
		   --set "Control Centre,Battery" script="$PLUGIN_DIR/battery.sh" \
		   update_freq=10                          \
		   label.drawing=on                        \
		   background.padding_left=-41             \
		   background.padding_right=-10              \
		   background.corner_radius=9              \
		   background.height=30                    \
		   background.width=50                     \
		   label.padding_left=-3                    \
		   label.padding_right=10                   \
		   icon.padding_left=35                    \
		   icon.padding_right=-3 \
		   background.color=$BACKGROUND_1 \
		   background.border_color=$BACKGROUND_2 \
		   background.border_width=2

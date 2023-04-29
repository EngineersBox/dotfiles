#!/usr/bin/env bash

calendar_date=(
	icon=date
	icon.font="$FONT:Black:12.0"
	icon.align=right
	icon.padding_right=0
	width=30
	y_offset=6
	update_freq=120
	script="$PLUGIN_DIR/date/date.sh"
	click_script="$PLUGIN_DIR/date/zen.sh"
)

calendar_clock=(
	icon=clock
	icon.font="$FONT:Bold:10.0"
	icon.align=right
	icon.padding_right=0
	background.padding_right=-20
	background.padding_left=0
	y_offset=-8
	update_freq=15
	script="$PLUGIN_DIR/date/clock.sh"
	click_script="$PLUGIN_DIR/date/zen.sh"
	label.padding_left=-20
)

sketchybar 	--add item calendar.date right 								\
						--set calendar.date "${calendar_date[@]}" 		\
						--subscribe calendar.date system_woke 				\
																													\
						--add item calendar.clock right 							\
						--set calendar.clock "${calendar_clock[@]}" 	\
						--subscribe calendar.clock system_woke

POPUP_CLICK_SCRIPT="sketchybar --set ical popup.drawing=toggle"

ical=(
	update_freq=180
	icon=􀉉
	icon.padding_right=-5
	icon.align=left
	popup.align=right
	#popup.height=20
	background.padding_left=20
	y_offset=-8
	script="$PLUGIN_DIR/date/ical.sh"
	click_script="$POPUP_CLICK_SCRIPT"
)

ical_details=(
	drawing=off
	background.corner_radius=12
	padding_left=7
	padding_right=7
	icon.font="$FONT:Bold:12.0"
	icon.background.height=2
	icon.background.y_offset=-12
	background.padding_left=5
	background.padding_right=10
)

sketchybar  --add       item            ical right                            \
            --set       ical            "${ical[@]}"                          \
                                                                              \
            --add       item            ical.details popup.ical               \
            --set       ical.details    "${ical_details[@]}"                  \
            --subscribe ical            mouse.entered                         \
                                        mouse.exited                          \
                                        mouse.exited.global

#!/bin/bash

BATT_PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
sketchybar --trigger battery_level BATTERY_LEVEL=$BATT_PERCENT

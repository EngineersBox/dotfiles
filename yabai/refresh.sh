#!/usr/bin/env sh

number_of_windows=$(yabai -m query --windows --space | ~/.nix-profile/bin/jq 'length')
number_of_stacked=$(yabai -m query --windows --space | ~/.nix-profile/bin/jq -c 'map(select(."stack-index" != 0)) | length')

padding=10

[[ "$number_of_windows" -eq 1 ]] && padding=0


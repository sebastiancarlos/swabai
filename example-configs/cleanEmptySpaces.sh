#!/usr/bin/env bash

# source:
# - https://github.com/koekeishiya/yabai/issues/213#issuecomment-1358715546

yabai -m query --spaces --display | \
  jq -re 'all(."is-native-fullscreen" | not)' &> /dev/null || exit; \

hidden_windows=$(yabai -m query --windows | jq 'map(select(."is-hidden")) | map(."id")'); \

yabai -m query --spaces | \
  jq -re "map(select((.\"has-focus\" | not) and (\
    .\"windows\" | map(select(. as \$window | $hidden_windows | index(\$window) | not))\
    ) == []).index) | reverse | .[]" | \
  xargs -I % sh -c 'yabai -m space % --destroy'

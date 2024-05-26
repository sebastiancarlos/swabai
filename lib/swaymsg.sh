# function which calls swaymsg if defined, or fallback to i3-msg
# for cross-compatibility between sway and i3
swaymsg() {
  if command -v swaymsg >/dev/null 2>&1; then
    command swaymsg "$@"
  else
    command i3-msg "$@"
  fi
}

#!/bin/bash
if xdotool search --class $1 > /dev/null
then
    window=$(xdotool search --desktop "$(xdotool get_desktop)" --class $1  | head -1)
    xdotool windowactivate --sync $window
    exit 1
else
    $1 &
    exit 0
fi

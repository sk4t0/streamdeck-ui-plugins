#!/bin/bash
pkill -f firefox-developer-edition;
pkill -f spotify;
qdbus org.kde.ActivityManager /ActivityManager/Activities SetCurrentActivity $( grep -Po '.*?(?=\=relax)' ~/.config/kactivitymanagerdrc | awk "NR==1") &
sleep 1
firefox-developer-edition &
sleep 1
xdotool mousemove 1930 30;
spotify


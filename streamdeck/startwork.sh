#!/bin/bash
pkill -f firefox-developer-edition;
pkill -f code-insiders;
pkill -f konsole;
pkill -f mysql-workbench;
pkill -f slack;
qdbus org.kde.ActivityManager /ActivityManager/Activities SetCurrentActivity $( grep -Po '.*?(?=\=work)' ~/.config/kactivitymanagerdrc | awk "NR==1") &
sleep 1
xdotool mousemove 0 y;
konsole --noclose --layout $HOME/Lavoro/konsoleLavoro.json &
sleep 2
xdotool type --delay=5 "cd $HOME/Lavoro/Homestead && vagrant up && vagrant ssh"
sleep 1
xdotool key enter;
code-insiders
xdotool mousemove 1930 y;
mysql-workbench &
sleep 1
firefox-developer-edition &
sleep 1
slack

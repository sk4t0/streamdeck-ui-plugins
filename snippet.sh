#!/bin/bash
xclip -sel c < /home/skato/streamdeck/snippets/$1 && xdotool key ctrl+v

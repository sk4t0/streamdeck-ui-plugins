#!/bin/bash
xclip -sel c < $HOME/streamdeck/snippets/$1 && xdotool key ctrl+v

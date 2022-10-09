#!/bin/bash
user=$(whoami)
echo "hi $user on $HOSTNAME";
sed -i "s/skato/$user/" .streamdeck_ui.json
sed -i "s/minibee/$HOSTNAME/" .streamdeck_ui.json
sudo cp -r icons/BeautyLine /usr/share/icons/BeautyLine
cp -r streamdeck $HOME/streamdeck

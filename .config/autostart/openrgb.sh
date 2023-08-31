#!/bin/zsh

# To add delay to the autostarting of openrgb
/usr/bin/sleep 10
export QT_QPA_PLATFORM=wayland;xcb
/usr/bin/openrgb -p red --startminimized

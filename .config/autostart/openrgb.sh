#!/bin/sh

# Running openrgb twice to fix it failing to set color profile.

/usr/bin/openrgb -p red --startminimized &
sleep 20
killall openrgb
/usr/bin/openrgb -p red --startminimized


#!/bin/sh

# Running openrgb twice to fix it failing to set color profile to ram.

/usr/bin/openrgb -p red --startminimized
/usr/bin/sleep 10
/usr/bin/killall openrgb
/usr/bin/openrgb -p red --startminimized

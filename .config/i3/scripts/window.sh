#!/bin/bash
i3status "$@" | while :
do
    read line
    id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
    name=$(xprop -id $id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
    if [ "$name" == "" ]; then
       echo "$line" || exit 1
    else
       echo "$name << $line" || exit 1
    fi
done

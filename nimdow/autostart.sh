#!/bin/env bash

launch-compton &

sxhkd &

nimdowstatus &
dunst &
unclutter &
"$HOME"/.fehbg

weather-daemon 300 &

xset r rate 300 30
xset s off
xset -dpms

nm-applet &
discord &


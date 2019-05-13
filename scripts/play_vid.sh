#!/bin/bash

dir=$HOME/Videos/
mpv "$dir$(find "$dir" -name "*\.*" | sed "s|$dir||g" | rofi -dmenu)"


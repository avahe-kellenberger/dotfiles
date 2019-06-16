#!/bin/bash

rm ~/.config/i3/wallpaper &>/dev/null; ln -s $(find ~/Pictures -name "*\.png" | sxiv -riot | head -n 1) ~/.config/i3/wallpaper


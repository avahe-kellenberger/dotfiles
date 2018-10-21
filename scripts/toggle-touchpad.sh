#!/usr/bin/env bash

# Make sure regex is case insensitive.
shopt -s nocasematch

regex="touchpad[^id]*id=([0-9]*)"

if [[ $(xinput list) =~ $regex ]]; then
    touchpad_id=${BASH_REMATCH[1]}
    regex="Device Enabled[^:]*:[^01]*(0|1)"
    if [[ $(xinput --list-props "$touchpad_id") =~ $regex ]]; then
        status=${BASH_REMATCH[1]}
        if [ "$status" == '1' ]; then
            xinput disable "$touchpad_id"
        else
            xinput enable "$touchpad_id"
        fi
    else
        echo "Failed to find touchpad state"
    fi
else
    echo "Failed to find touchpad."
fi

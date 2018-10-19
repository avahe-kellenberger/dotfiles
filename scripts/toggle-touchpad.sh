#!/usr/bin/env bash

touchpad_id=$(xinput list | grep -i -Pazo '(?<=touchpad).*=([0-9]*)' | grep -i -Pazo '(?<=id=)[0-9]*' | awk '{print $1}')

status=$(xinput --list-props "$touchpad_id" | grep -i 'device enabled' | grep -Pao '(\d+)(?!.*\d)' | awk '{print $1}')

if [ $status == '1' ]; then
    xinput disable "$touchpad_id" 
else
    xinput enable "$touchpad_id"
fi


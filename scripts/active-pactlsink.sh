#!/usr/bin/env bash

regex="([0-9]+)\s+.*RUNNING"

if [[ $(pactl list sinks short) =~ $regex ]]; then
    echo "${BASH_REMATCH[1]}"
else
    echo "Match not found."
fi


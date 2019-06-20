#!/usr/bin/env bash

pactl list sinks short | while read -r id info; do
    ${1//%s/"$id"}
done

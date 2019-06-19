#!/bin/bash

get_status() {
    echo "Vol: $(get_volume) | $(get_datetime)";
}

get_volume() {
    echo "$(pamixer --get-volume-human)";
}

get_datetime() {
    echo "$(date +"%a %e %b %Y - %I:%M %p %Z")";
}

while true
do
    xsetroot -name "$(get_status)";
    sleep 1m;
done


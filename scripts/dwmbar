#!/bin/bash

# Set the overall status
get_status() {
    battery_status="$(get_battery_status)";
    if [[ ! -z battery_status ]]; then
        battery_status="${battery_status} | "
    fi

    echo "${battery_status}Vol: $(get_volume) | $(get_datetime)";
}

get_volume() {
    echo "$(pamixer --get-volume-human)";
}

get_datetime() {
    echo "$(date +"%a %e %b %Y - %I:%M %p %Z")";
}

# Battery

battery="BAT0";

get_battery_status() {
    battery_status="";
    charging_status="$(get_charging_status)";
    if [[ ! -z charging_status ]]; then
        battery_status="${charging_status} $(get_charge)%"
    fi
    echo "$battery_status";
}

get_charging_status() {
    echo "$(cat /sys/class/power_supply/$battery/status)"
}

get_charge() {
    echo "$(cat /sys/class/power_supply/$battery/capacity)"
}

# Set the status bar

while true
do
    xsetroot -name "$(get_status)";
    sleep 1m;
done


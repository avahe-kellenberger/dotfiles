#!/bin/bash

if [[ "$1" = "-h" ]] || [[ "$1" = "--help" ]]; then
    printf "Help Menu:\n\n"

    printf "      Run:                 ./weather.sh\n"
    printf "      Help menu:          [-h | --help]\n"
    printf "      Display with icon:  [-i | --icon]\n"
    exit
fi

API_KEY="730d0819cbc5feae20f1a2271c73752e"

# Check on http://openweathermap.org/find
CITY_ID="4352053"

ICON_SUNNY=""
ICON_CLOUDY=""
ICON_RAINY=""
ICON_STORM=""
ICON_SNOW=""
ICON_FOG=""

SYMBOL_FARENHEIT="˚F"

WEATHER_URL="http://api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&appid=${API_KEY}&units=imperial"
WEATHER_RAW=$(wget -qO- "${WEATHER_URL}")
if [[ -z "${WEATHER_RAW}" ]]; then
    echo "Failed to connect."
    exit
fi

WEATHER_INFO=$(echo "${WEATHER_RAW}" | jq '.weather[0]')
WEATHER_MAIN=$(echo "${WEATHER_INFO}" | jq '.main' | tr -d '"')
WEATHER_DESCRIPTION=$(echo "${WEATHER_INFO}" | jq '.description' | tr -d '"' | sed 's/./\U&/')
WEATHER_TEMP=$(echo "${WEATHER_RAW}" | jq '.main.temp')

current_icon=""
if [[ $1 == "-i" ]]; then
    if [[ "${WEATHER_MAIN}" = *Snow* ]]; then
        current_icon="${ICON_SNOW} "
    elif [[ "${WEATHER_MAIN}" = *Rain* ]] || [[ "${WEATHER_MAIN}" = *Drizzle* ]]; then
        current_icon="${ICON_RAINY} "
    elif [[ "${WEATHER_MAIN}" = *Cloud* ]]; then
        current_icon="${ICON_CLOUDY} "
    elif [[ "${WEATHER_MAIN}" = *Clear* ]]; then
        current_icon="${ICON_SUNNY} "
    elif [[ "${WEATHER_MAIN}" = *Fog* ]] || [[ "${WEATHER_MAIN}" = *Mist* ]]; then
        current_icon="${ICON_FOG} "
    fi
fi

echo "${current_icon}${WEATHER_DESCRIPTION} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}" 

#!/bin/bash

if [[ "$1" = "-h" ]] || [[ "$1" = "--help" ]]; then
    printf "Help Menu:\n\n"
    
    printf "      Run:                 ./weather.sh\n"
    printf "      Help menu:          [-h | --help]\n"
    printf "      Display with icon:  [-i | --icon]\n"
    exit
fi
# 'weather -i' = with icon, 'weather' = text only

# Open Weather Map API code, register to http://openweathermap.org to get one ;)
API_KEY="730d0819cbc5feae20f1a2271c73752e"

# Check on http://openweathermap.org/find
CITY_ID="4352053"

ICON_SUNNY=" Clear"
ICON_CLOUDY=" Cloudy"
ICON_RAINY=" Rainy"
ICON_STORM=" Storm"
ICON_SNOW=" Snow"
ICON_FOG=" Fog"
ICON_MISC=""

TEXT_SUNNY="Clear"
TEXT_CLOUDY="Cloudy"
TEXT_RAINY="Rainy"
TEXT_STORM="Storm"
TEXT_SNOW="Snow"
TEXT_FOG="Fog"

SYMBOL_FARENHEIT="˚F"

WEATHER_URL="http://api.openweathermap.org/data/2.5/weather?id=${CITY_ID}&appid=${API_KEY}&units=imperial"

WEATHER_INFO=$(wget -qO- "${WEATHER_URL}")
WEATHER_MAIN=$(echo "${WEATHER_INFO}" | grep -o -e '\"main\":\"[A-Za-z]*\"' | awk -F ':' '{print $2}' | tr -d '"')
WEATHER_TEMP=$(echo "${WEATHER_INFO}" | grep -o -e '\"temp\":\-\?[0-9]*' | awk -F ':' '{print $2}' | tr -d '"')

if [[ -z "${WEATHER_MAIN}" ]]; then
    echo "Failed to connect."
    exit
fi

if [[ "${WEATHER_MAIN}" = *Snow* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${ICON_SNOW} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	else
    echo "${TEXT_SNOW} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	fi
elif [[ "${WEATHER_MAIN}" = *Rain* ]] || [[ "${WEATHER_MAIN}" = *Drizzle* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${ICON_RAINY} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	else
    echo "${TEXT_RAINY} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	fi
elif [[ "${WEATHER_MAIN}" = *Cloud* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${ICON_CLOUDY} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	else
    echo "${TEXT_CLOUDY} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	fi
elif [[ "${WEATHER_MAIN}" = *Clear* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${ICON_SUNNY} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	else
    echo "${TEXT_SUNNY} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	fi
elif [[ "${WEATHER_MAIN}" = *Fog* ]] || [[ "${WEATHER_MAIN}" = *Mist* ]]; then
	if  [[ $1 = "-i" ]]; then
    echo "${ICON_FOG} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	else
    echo "${TEXT_FOG} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	fi
else
	if  [[ $1 = "-i" ]]; then
    echo "${ICON_MISC} ${WEATHER_MAIN} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	else
    echo "${WEATHER_MAIN} ${WEATHER_TEMP}${SYMBOL_FARENHEIT}"
	fi	
fi

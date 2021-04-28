#!/bin/bash
pactl load-module module-null-sink sink_name=Virtual1
pactl load-module module-loopback source='alsa_input.usb-SteelSeries_SteelSeries_Arctis_7-00.mono-chat' sink=Virtual1
pactl load-module module-loopback source=Virtual1.monitor sink='alsa_output.usb-SteelSeries_SteelSeries_Arctis_7-00.stereo-game.monitor'

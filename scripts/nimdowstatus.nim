{.define(shellNoDebugOutput).}

import shell

proc foo() =
  var info: string
  shellAssign:
    info = "nmcli"
  echo info
  # device="$(echo "$info" | pcregrep -o1 -i "connected to (.*)")"
  # if [[ ! -z "$device" ]]; then
  #     type="$(echo "$info" | awk 'NR==3 { print $1 }')"
  #     printf "%s: %s" "$type" "$device"
  # fi

foo()

# get_volume() {
#     vol="$(pamixer --get-volume-human)"
#     if [[ "$vol" == "muted" ]]; then
#         printf "🔇 %s" "$vol"
#     else
#         printf "🔊 %s" "$vol"
#     fi
# }

# get_datetime() {
#     date +"📅 %a %d %b %Y | 🕓 %I:%M %p %Z"
# }

# # Battery

# battery="BAT0";

# has_battery() {
#     if [ -d /sys/class/power_supply/$battery ]; then
#         return 0;
#     fi
#     return 1;
# }

# get_battery_status() {
#     charge="$(get_charge)"
#     if [ "$(get_charging_status)" == "Discharging" ]; then
#         icon=""
#         if [[ "$charge" -le 10 ]]; then
#             icon=""
#         elif [[ "$charge" -le 20 ]]; then
#             icon=""
#         elif [[ "$charge" -le 30 ]]; then
#             icon="" 
#         elif [[ "$charge" -le 40 ]]; then
#             icon="" 
#         elif [[ "$charge" -le 50 ]]; then
#             icon="" 
#         elif [[ "$charge" -le 60 ]]; then
#             icon="" 
#         elif [[ "$charge" -le 70 ]]; then
#             icon="" 
#         elif [[ "$charge" -le 80 ]]; then
#             icon="" 
#         elif [[ "$charge" -le 90 ]]; then
#             icon="" 
#         elif [[ "$charge" -le 100 ]]; then
#             icon="" 
#         else
#             icon=""
#         fi
#     else
#         icon=""
#     fi
#     echo ""$icon" "$charge"%"
# }

# get_charging_status() {
#     cat "/sys/class/power_supply/$battery/status"
# }

# get_charge() {
#     cat "/sys/class/power_supply/$battery/capacity"
# }

# # Set the status bar

# green=$'\e[38;2;80;250;123m'

# while true
# do
#     # xsetroot -name "NIMDOW_MONITOR_INDEX=0 ${green}$(get_status)NIMDOW_MONITOR_INDEX=1";
#     xsetroot -name "${green}$(get_status)";
#     sleep 1m;
# done



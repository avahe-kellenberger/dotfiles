scrot -se 'curl -s -F c=@- https://ptpb.pw/ < $f' | awk '$1 = /url/ { printf $2".png" }' | xclip -sel clipboard

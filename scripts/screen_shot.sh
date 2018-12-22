maim -sou | curl -s -F c=@- https://ptpb.pw/ | awk '$1 = /url/ { printf $2".png" }' | xclip -sel clipboard

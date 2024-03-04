if [ "$(mpc status '%state%')" = "playing" ]; then
    status="$(mpc status | head -n 1)"
    printf "%s | " "$status"
else
    echo "else"
fi


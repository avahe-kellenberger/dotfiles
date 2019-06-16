#!/bin/bash

feh --bg-scale $(find ~/Pictures -name "*\.png" | sxiv -riot | head -n 1)


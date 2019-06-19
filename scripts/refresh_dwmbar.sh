#!/bin/bash

kill $(pstree -lp | pcregrep -o1 "dwmbar\.sh\(.*sleep\(([0-9].*)\)")

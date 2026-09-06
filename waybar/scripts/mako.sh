#!/bin/bash
# set -euo pipefail

COUNT="$(makoctl list | grep -cv '^[[:space:]]')"
ENABLED="🔔"
DISABLED="🔕"

if [ "$COUNT" != 0 ]; then
  DISABLED="🔕 $COUNT"
fi

if makoctl mode | grep -q "do-not-disturb"; then
  echo "$DISABLED"
else
  echo "$ENABLED"
fi


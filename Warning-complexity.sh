#!/bin/bash

if [ "$CONFIGURATION" == "Debug" ]; then
echo "Skipping complexity script"
exit 0 #exit shell script
fi

find "${SRCROOT}" \( -name "*.h" -or -name "*.m" \) -print0 | xargs -0 wc -l | awk '$1 > 400 && $2 != "total" { print $2 ":1: warning: $2 has more than 400 lines, consider refactoring." }'

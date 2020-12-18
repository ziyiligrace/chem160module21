#!/bin/bash
if [ $1 -lt 100 ] || [ $1 -gt 1000 ]; then
echo "Value given not in range (100 to 1000)"
exit 1
fi

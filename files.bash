#!/bin/bash
if [ $# -eq 1 ]; then
count=0
for i in *.$1; do
let count++
done
echo "$count files with $1 suffix"
else
echo "Need 1 argument"
fi

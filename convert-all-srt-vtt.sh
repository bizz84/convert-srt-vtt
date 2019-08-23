#!/bin/bash

for file in *.srt; do
    [ -f "$file" ] || continue
    convert-srt-vtt.sh "$file"
done

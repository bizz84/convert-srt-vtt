#!/bin/bash
if [ "$#" -lt 1 ]; then
  echo "Syntax: convert-srt-vtt.sh file.srt"
  exit
fi

output="$1.vtt"

# Clear output file if already exists
echo "WEBVTT" > "$output"
echo "" >> "$output"

index=0
prev_start=""
prev_end=""
prev_content=""
start=""
end=""
while IFS= read -r line; do
  if [ $index == 1 ]; then
    vtt_time=$(echo "$line" | tr "," ".")
    # start, end
    IFS=' ' read -r -a values <<< "$vtt_time"
    start=${values[0]}
    end=${values[${#values[@]}-1]}
  fi
  if [ $index == 2 ]; then
    if [ "$prev_start" != "" ]; then
      echo "$prev_start --> $start" >> "$output"
      echo "$prev_content" >> "$output"
      echo "" >> "$output"
    fi
    prev_start=$start
    prev_end=$end
    prev_content=$line
  fi
  index=$(( $index + 1 ))
  index=$(( $index % 4 ))
done < "$1"

echo "$prev_start --> $prev_end" >> "$output"
echo "$prev_content" >> "$output"
echo "" >> "$output"

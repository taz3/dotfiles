#!/bin/bash

output_info=$(wlr-randr --json | jq -r '
    .[] | {name: .name, mode: (.modes | max_by(.refresh) | {width, height, refresh})}
')

# Extract the display name and the highest refresh mode details
display_name=$(echo "$output_info" | jq -r '.name')
width=$(echo "$output_info" | jq -r '.mode.width')
height=$(echo "$output_info" | jq -r '.mode.height')
refresh=$(echo "$output_info" | jq -r '.mode.refresh')

format="${width}x${height}@${refresh}"

wlr-randr --output "$display_name" --mode "$format" --adaptive-sync enabled

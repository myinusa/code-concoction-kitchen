#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -lt 2 ] || [ "$#" -gt 3 ]; then
    echo "Usage: $0 <directory> <filename> [output_file]"
    exit 1
fi

DIRECTORY=$1
FILENAME=$2
OUTPUT_FILE=$3

# Find files and get their modification times
FILES=$(find "$DIRECTORY" -type f -name "$FILENAME" -exec stat --format="%Y %n" {} \; | sort -nr)

# Check if any files were found
if [ -z "$FILES" ]; then
    echo "No files found."
    exit 0
fi

# Prepare the markdown table header
HEADER="| Modification Time | File Path |\n|-------------------|-----------|"

# Prepare the markdown table content
CONTENT=$(echo "$FILES" | while read -r LINE; do
    MOD_TIME=$(echo "$LINE" | awk '{print $1}')
    FILE_PATH=$(echo "$LINE" | awk '{print $2}')
    HUMAN_READABLE_TIME=$(date -d @$MOD_TIME +"%Y-%m-%d %H:%M:%S")
    echo "| $HUMAN_READABLE_TIME | $FILE_PATH |"
done)

# Output to file or stdout
if [ -n "$OUTPUT_FILE" ]; then
    echo -e "$HEADER\n$CONTENT" > "$OUTPUT_FILE"
    echo "Output written to $OUTPUT_FILE"
else
    echo -e "$HEADER\n$CONTENT"
fi
#!/usr/bin/env bash

DIR="."

# Iterate over each file in the directory
for file in "$DIR"/*; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    echo "Running: lddc $filename lib_$filename"
    lddc "$filename" "lib_$filename"
  fi
done

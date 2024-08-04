#!/usr/bin/env bash

DIR="."

# Iterate over each file in the directory
for file in "$DIR"/*; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    echo "Running: lddc $filename $filename_lib"
    lddc "$filename" "$filename_lib"
  fi
done

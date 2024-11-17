#!/bin/bash

# Find all .mp4 files in the current folder and extract the first frame as posters
for video in *.mp4; do
    # Check if the file exists (in case there are no .mp4 files)
    if [[ -f "$video" ]]; then
        echo "Processing $video..."
        # Extract the first frame
        ffmpeg -i "$video" -vf "select=eq(n\,0)" -vsync vfr -q:v 2 "${video%.mp4}_poster.jpg"
        echo "First frame extracted for $video."
    else
        echo "No .mp4 files found in the current folder."
    fi
done

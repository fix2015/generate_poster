## Generate Posters

A powerful feature of this library is the ability to generate posters for your video files automatically. This ensures that users do not encounter any blinking or white screens between videos, as the poster is pre-generated from the first frame of each video.

If you'd like to generate posters, you can use a separate repository called **[generate_poster](https://github.com/fix2015/generate_poster)**, which provides a simple Bash script to automatically extract the first frame from each video and save it as a poster image.

### Steps to Generate Posters:

1. **Clone the `generate_poster` Repository**

   First, clone the **[generate_poster](https://github.com/fix2015/generate_poster)** repository:

   ```
   git clone https://github.com/fix2015/generate_poster.git
   ```

2. **Navigate to the Project Folder**

   After cloning, navigate to the `generate_poster` project folder:

   ```
   cd generate_poster
   ```

3. **Run the Script to Generate Posters**

   The repository contains a Bash script (`generate_poster.sh`) that will automatically extract the first frame from each `.mp4` video in the directory and save it as a `.jpg` image. Run the script with:

   ```
   bash generate_poster.sh
   ```

### The `generate_poster.sh` Script:

Here is the content of the `generate_poster.sh` script, which you can use to generate posters for your video files:

```bash
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
```

### How it Works:

- The script uses `ffmpeg` to extract the first frame of each `.mp4` video.
- The first frame is saved as a `.jpg` image in the same folder as the video, with the `_poster` suffix added to the filename.
- This process allows you to generate high-quality posters to be used in your interactive video player.

### Example:

If you have the following video files in your directory:
video1.mp4 video2.mp4 video3.mp4

After running the script, you will have the following poster images generated:

These posters can then be used in your video player configuration to enhance the user experience by preventing flickering or a white screen between video transitions.

---

## This repository was created to generate posters for the **[interactive-video-player](https://github.com/fix2015/interactive-video-player)**.

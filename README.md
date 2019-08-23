# Srt to VTT converter

This script can be used to convert subtitles from Srt to VTT format.

## Example workflow: Generate VTT subtitles for an existing video

### (Optional) Upload Video to YouTube and generate Closed Captions

- Upload video: [https://www.youtube.com/upload](https://www.youtube.com/upload)
- Open with the (old) Creator Studio
- Set video as unlisted (if this should not be public)
- Once video is uploaded, select Subtitles/CC tab and wait until CCs are published (auto-generated)

## Download Video

- Install [4K Video Downloader](https://www.4kdownload.com)
- Copy video Url
- Paste link in 4K Video Downloader
- Download in 360p (saves disk space), and choose subtitles

This will download .mp4 and .srt files for the video

## Convert

Run:

`convert-srt-vtt.sh` file.srt

This will output a `file.srt.vtt` file.

## Batch convert

`convert-all-srt-vtt.sh` can be used to convert all files in a given folder.

## Important note

The start and end times for each caption can be interleaved, but showing interleaved captions is only supported on some players.

This script manipulates the timestamps to de-interleave them.

# Srt to VTT converter

This script can be used to convert subtitles from Srt to VTT format.

## Example workflow: Generate VTT subtitles for your own videos

### Upload Video to YouTube and generate Closed Captions

- Upload video: [https://www.youtube.com/upload](https://www.youtube.com/upload)
- Open with the (old) Creator Studio
- Set video as unlisted (if this should not be public)
- Once video is uploaded, select Subtitles/CC tab and wait until CCs are published (auto-generated)
- Then Click on the Generated CC and download the subtitles in `.srt` format.

**NOTE**: YouTube supports downloading captions in VTT format as well. But the VTT format used is not supported by all players (e.g. Udemy).

Hence, this script was created to convert `.srt` to "simple" `.vtt`.

## Convert

Run:

```
convert-srt-vtt.sh file.srt
```

This will output a `file.srt.vtt` file.

## Batch convert

To convert all files in a given folder, run:

```
convert-all-srt-vtt.sh
```

## Important note

The start and end times for each caption can be interleaved, but showing interleaved captions is only supported on some players.

This script manipulates the timestamps to de-interleave them.

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

## Overlapping captions

When using `.srt`, the start and end times for each caption can overlap.

Example input file (notice how the end time of each caption is after the start time of the next caption):

```
1
00:00:00,030 --> 00:00:04,920
hello and welcome to my course on coding

2
00:00:02,730 --> 00:00:06,930
with flutter by taking this course you

3
00:00:04,920 --> 00:00:09,510
will learn how to use flutter to build
```

Unfortunately, not all players support overlapping captions.

So this script manipulates the timestamps, so that each caption starts exactly at the end of the previous one.

Example output file:

```
WEBVTT

00:00:00.030 --> 00:00:02.730
hello and welcome to my course on coding

00:00:02.730 --> 00:00:04.920
with flutter by taking this course you

00:00:04.920 --> 00:00:06.930
will learn how to use flutter to build
```

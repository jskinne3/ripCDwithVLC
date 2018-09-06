#!/bin/bash

# Rip every track on a CD to an .ogg file
# Uses MacOS and VLC media player

# Set the type of file to save
bitrate=256
format=vorb

echo Enter artist name
read artist
echo Enter album name
read album

# Create a new dir to hold music in the user's current dir
mkdir $artist

for f in /Volumes/Audio\ CD/*
do

  # Track numbers are extracted from the source file names
  number=$(printf "%02d" ${f//[!0-9]/})
  trackname=$album\_$number
  pathname=$artist/$trackname

  echo ==== Ripping $f as $pathname
  
  # Open VLC, rip music, and close
  /Applications/VLC.app/Contents/MacOS/VLC -I dummy "$f" ":sout=#transcode{acodec=$format,ab=$bitrate}:std{dst=$pathname.ogg,access=file}" vlc://quit

done

#!/bin/bash

# Rip every track on a CD to a .ogg file
# Uses MacOS and VLC media player

echo Enter artist name
read artist
echo Enter album name
read album

mkdir $artist

#cd /Volumes/Audio\ CD/

for f in /Volumes/Audio\ CD/*
do

  number=$(printf "%02d" ${f//[!0-9]/})
  trackname=$album\_$number
  pathname=$artist/$trackname

  echo ==== Ripping track $f as file $pathname
  
  /Applications/VLC.app/Contents/MacOS/VLC -I dummy "$f" ":sout=#transcode{acodec=vorb,ab=256}:std{dst=$pathname.ogg,access=file}" vlc://quit

done

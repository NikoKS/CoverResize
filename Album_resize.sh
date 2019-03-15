#!/bin/bash
#a bash script to resize all the album art in a folder from 1200x1200 into 600x600.
#This will allow the album art to be displayed on the music player

#check if only one input is added
if [ $# -ne 1 ]
then
  echo "One argument is needed"
  exit 1
fi
#check if the input is a directory
if ! [[ -d $@ ]]  
then
  echo "Input must be a folder directory"
  exit 1
fi
#prompt the user if the command really want to be executed
read -p "Are you sure you want to resize all folder.jpg file on $1? (y/n)" -n 1 
case "$REPLY" in
  y|Y ) printf "\nResizing all folder.jpg\n"
    find "$@" -iname 'folder.jpg' -execdir mogrify -resize 240x235 {} \;
    ;;
  * )   printf "\nExiting code\n"
    ;;
esac


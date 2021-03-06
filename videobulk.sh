#!/bin/bash
#
# Script to convert all video files from a directory (parameter) into mp4 format file

# Sanity checks ?
if [ $# -eq 0 ]
 then 
	directory=$PWD
  elif [ -d $1 ]
	then
	directory=$1
  else
	echo "sorry. $1 is not a directory"
fi
    

# Main code

ls -1 $1*.avi > videofiles

if [ $2 == "lavc" ]
then
	while read videofile
	do
		lengthname=${#videofile}	#Gets the length of the name
		namefile=${videofile:0:lengthname-4}	#Gets just the name (without extension)
		mencoder $videofile -o $namefile.mp4 -oac mp3lame -ovc lavc #Uses lavc codec

		if [ $3 == "-rm" ]
		then
			rm $namefile.avi
		fi

		echo "File(s) saved."
	done < videofiles
	rm videofiles
fi

if [ $2 == "x264" ]
then
	while read videofile
	do
		lengthname=${#videofile}	#Gets the length of the name
		namefile=${videofile:0:lengthname-4}	#Gets just the name (without extension)
		mencoder $videofile -o $namefile.mp4 -oac mp3lame -ovc x264 #Uses x264 codec

		if [ $3 == "-rm" ]
		then
			rm $namefile.avi
		fi

		echo "File(s) saved."
	done < videofiles
	rm videofiles
fi

if [ $2 == "frameno" ]
then
	while read videofile 
	do
		lengthname=${#videofile}	#Gets the length of the name
		namefile=${videofile:0:lengthname-4}	#Gets just the name (without extension)
		mencoder $videofile -o $namefile.mp4 -oac mp3lame -ovc frameno #Uses frameno codec
		
		if [ $3 == "-rm" ]
		then
			rm $namefile.avi
		fi

		echo "File(s) saved."
	done < videofiles
	rm videofiles
fi

exit 0

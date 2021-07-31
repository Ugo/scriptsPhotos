#!/bin/bash

# those 2 lines are used to be able to manage folders with white spaces in their name
IFS="
"

# take the folder as the first parameter, if nothing is defined the current folder will be used
dir=$1
if [ -z $dir ]
then
	dir="."
fi

cd $dir

# select all the leaf folders (they should be the only one to contain pictures)
for dir in $( find . -type d -links 2 -print ); do
	cd $dir
	echo "Computing md5 sum for folder" $dir
	# find all files that are not chk and compute their md5 sum
	find . -type f ! -name \*.md5 -exec md5sum '{}' ';' | sort > checkMD5Files.md5
	cd -
done

#!/bin/bash

# those 2  lines are used to be able to manage folders with white spaces in their name
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
	echo "Checking md5 values for folder" $dir
    # find the check file of the folder and run a check from that file ('-c' option) on files in the folder
	find . -type f -name \*.md5 -exec md5sum -c '{}' ';'
	cd -
done

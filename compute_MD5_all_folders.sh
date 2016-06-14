#!/bin/bash

# those 2 lines are used to be able to manage folders with white spaces in their name
IFS="
"

cd /home/ugo/temp/TO_DELETE/test

# select all the leaf folders (they should be the only one to contain pictures)
for dir in $( find . -type d -links 2 -print ); do
	cd $dir
	echo "Computing md5 sum for folder" $dir
	# find all files that are not chk and compute their md5 sum
	find . -type f ! -name \*.chk -exec md5sum '{}' ';' > checklist.chk
	cd -
done

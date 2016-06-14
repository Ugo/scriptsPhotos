#!/bin/bash

# those 2 lines are used to be able to manage folders with white spaces in their name
IFS="
"

cd /home/ugo/temp/TO_DELETE/test

# select all the leaf folders (they should be the only one to contain pictures)
for dir in $( find . -type d -links 2 -print ); do
	cd $dir
	echo "Checking md5 values for folder" $dir
	find . -type f -name \*.chk -exec md5sum -c '{}' ';'
	cd -
done

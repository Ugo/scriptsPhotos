##################################################################
# This file gives of few example on how to compute and manipulate md5 checksums in the pictures folders
##################################################################

# basic generation of a list of checksums for any file that matches *
md5sum * > checklist.chk  

# basic check on the list of checksums
md5sum -c checklist.chk

# compute all md5 sums of the folder except for chk files
find . -type f ! -iname \*.chk -exec md5sum '{}' ';' | sort > checklist.chk

# in each folder, the following should be run (it should be more general with more file formats)
find . -type f -iname \*.jpg -exec md5sum '{}' ';' > checklist.chk

# in the top folder, the following should be run
find . -type f -iname \*.chk -exec md5sum '{}' ';' | sort > checklist.bigchk

# to get only leaf level folders:
find . -type d -links 2

# find all extensions under a folder:
find . -type f | sed -rn 's|.*/[^/]+\.([^/.]+)$|\1|p' | sort -u

# find all images in a folder:
find . -type f -exec file {} \; | awk -F: '{ if ($2 ~/image/) print $1}'

# check duplicates
find . -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > duplicates.txt

# remove all chk files
find . -type f -iname \*.chk -exec rm {} \;

# copy all the check files but keep the folders structures:
find . -name '*.chk' -exec cp --parents \{\} /full/path/target/folder \;

# check number of files having their md5sum computed in the whole folder (without the other files)
find . -type f -iname \*.chk -exec cat {} \; | wc -l

# number of files in total (except the check files)
find . -type f ! -iname \*.chk | wc -l

# find empty directories
find . -type d -empty

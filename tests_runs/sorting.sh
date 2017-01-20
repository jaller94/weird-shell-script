#!/bin/sh
# Author: Christian Paul

# Create temporary dir
dir=`mktemp -d`

# Create test files in the temporary folder
touch -d 2016-01-01 "$dir/ce101.txt"
touch -d 2016-02-05 "$dir/dd205.txt"
touch -d 2016-03-03 "$dir/ac303.txt"
touch -d 2016-04-04 "$dir/ba404.txt"
touch -d 2016-06-02 "$dir/eb602.txt"

./script.sh "$dir"

rm -r "$dir"

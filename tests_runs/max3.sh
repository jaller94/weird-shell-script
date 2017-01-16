#!/bin/sh
# Author: Christian Paul

# Create temporary dir
dir=`mktemp -d`

# Create test files in the temporary folder
touch -d 2016-01-01 "$dir/000101.txt"
touch -d 2016-01-02 "$dir/000102.txt"
touch -d 2016-01-03 "$dir/000103.txt"
touch -d 2016-01-04 "$dir/000104.txt"
touch -d 2016-01-05 "$dir/000105.txt"

./script.sh "$dir"

rm -r "$dir"

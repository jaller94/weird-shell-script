#!/bin/sh
# Author: Christian Paul

# Create temporary dir
dir=`mktemp -d`

# Create test files in the temporary folder
touch -d 2016-01-01 "$dir/c0e101.txt"
touch -d 2016-02-05 "$dir/d0d205.txt"
touch -d 2016-03-03 "$dir/a0c303.txt"
touch -d 2016-04-04 "$dir/b0a404.txt"
touch -d 2016-06-02 "$dir/e0b602.txt"

./script.sh "$dir"

rm -r "$dir"

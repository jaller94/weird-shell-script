#!/bin/sh
# Author: Christian Paul

# Find all files in a given folder
# Only process the first 3 files
# Reduce relative files paths to their file names
# Substring to the characters 3 to 6
# Sort the file name parts ascending and 
find "$1" -maxdepth 1 -type f | \
  head -3 | \
  awk -F "/" '{print $NF;}' | \
  awk '{print substr($0,4,3);}' | \
  sort -f


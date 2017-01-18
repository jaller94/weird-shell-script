#!/bin/bash
# Author: Christian Paul

# Find all files in a given folder
# Only process the first 3 files
# Reduce relative files paths to their file names
# Substring to the characters 3 to 6
# Sort the file name parts ascending

DIR=${1:-./} #Defaults to ./ dir

FILES="$(find "$DIR" -maxdepth 1 -type f | head -n 3)"

sortcharacters() {
	echo "$1" | grep -o . | sort | tr -d "\n"
}

while read -r FPATH; do
	FNAME="$(basename -- "$FPATH")"
	FNAME3="${FNAME:3:3}"
	FNAME3SORTED="$(sortcharacters "$FNAME3")"
	LINES="$(wc -l "$FPATH" | cut -d' ' -f1)"
	echo "$FNAME3SORTED   $LINES"
done <<< "$FILES"

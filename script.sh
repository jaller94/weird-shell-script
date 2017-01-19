#!/bin/bash
# Author: Christian Paul

# Find all files in a given folder
# Only process the first 3 files
# Reduce relative files paths to their file names
# Substring to the characters 3 to 6
# Sort the file name parts ascending

 #Defaults to ./ dir

listoldestfiles() {
	DIR=${1:-./}
	find "$DIR" -maxdepth 1 -type f -printf "%T+ %p\n" | \
		sort | \
		cut -d' ' -f2-
}

sortcharacters() {
	# Forward first parameter
	# Separate characters with new lines
	# Sort letters which are separated by new lines
	# Join the parts of the string
	echo -e "$1" | \
		grep -o . | \
		sort | \
		tr -d "\n"
}

FILES="$(listoldestfiles "$1" | head -3)"

while read -r FPATH; do
	FNAME="$(basename -- "$FPATH")"
	FNAME3="${FNAME:3:3}"
	FNAME3SORTED="$(sortcharacters "$FNAME3")"
	LINES="$(wc -l "$FPATH" | cut -d' ' -f1)"
	echo "$FNAME3SORTED   $LINES"
done <<< "$FILES"

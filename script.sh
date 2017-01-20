#!/bin/bash
# Author: Christian Paul

listoldestfiles() {
	# Default: current folder
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

# Find all files in a given folder
# Only process the first 3 files
FILES="$(listoldestfiles "$1" | head -3)"

while read -r FPATH; do
	# Reduce relative files paths to their file names
	FNAME="$(basename -- "$FPATH")"
	# Substring to the characters 3 to 5 (3 letters)
	FNAME3="${FNAME:2:3}"
	# Sort the letters in the file name parts ascending
	FNAME3SORTED="$(sortcharacters "$FNAME3")"
	# Count the line numbers
	LINES="$(wc -l "$FPATH" | cut -d' ' -f1)"
	echo "$FNAME3SORTED   $LINES"
done <<< "$FILES"

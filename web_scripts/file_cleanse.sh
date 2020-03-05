#!/bin/bash
# Simple help message for use when learning how to use the tool
if [ "$1" == '-h' ]; then
	echo './file_cleanse.sh SUB_FOLDER EXTENSION_LIST(COMMA DELIMITED) [--nums]'
	exit 0
fi

# Clean the metadata of the files within
exiftool -all= -overwrite_original -q -ext "$2" "$1"
# Rename the files to an iterating number if selected
if [ "$3" == '--nums' ]; then
	a=1
	# Get all files in the subfolder
	for i in "$1"/*; do
		# Format the number to 4 digits
		file_number=$(printf "%04d" "$a")
		# Get the extension of the file
		extension=$(echo "$i" | cut -d '.' -f 2)
		# Rename the file after the number and the extension
		mv -i -- "$i" "$1/$file_number.$extension"
		let a=a+1
	done
fi
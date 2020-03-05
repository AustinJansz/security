#!/bin/bash
# Simple help message for use when learning how to use the tool
if [ "$1" == '-h' ]; then
	echo './file_search.sh DOMAIN_NAME FILE_WORDLIST EXTENSION_WORDLIST UNWANTED_RESPONSE'
	exit 0
fi

# Customize user-agent
ua='Mozilla/5.0 (Windows NT 6.1; Win64,x64, rv:59.0) Gecko/20100101 Firefox/59.0'
# Read input wordlist line-by-line
while IFS= read -r file
do
	while IFS= read -r extension
	do
		# Create post data
		data=$(echo "username= $user &password= $password &login=Login" | sed 's/ //g')
		# Get the response for the request with the post data
		response=$(curl -s --max-time 5 --max-limit 100K -A "$ua" "$1/$file$extension")
		# Filter out non-successes
		echo "$response" | head -I | cut -d ' ' -f 2 | egrep -iq "$4" || echo "Found: $file$extension" | tee file_search.txt
		# sleep $(((RANDOM%5)+1))
	done < "$2"
done < "$3"
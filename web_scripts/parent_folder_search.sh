# Simple help message for use when learning how to use the tool
if [ "$1" == "-h" ]; then
  echo "./parent_folder_search.sh [DOMAIN_NAME] [PARAMETER] [KNOWN_FILE_PATH]"
  exit 0
fi

# Set the parent folder to blank to test current directory
parent_folder=""
# Iterate through 10 parent directories
for i in {0..10}
do
	echo "$1$2=$parent_folder$3"
	parent_folder+="../"
done

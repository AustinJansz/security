#!/bin/bash
# Simple help message for use when learning how to use the tool
if [ "$1" == "-h" ]; then
  echo "./wordpress_version-login.sh DOMAIN_NAME WORDPRESS_VERSION(DOTS REMOVED)"
  exit 0
fi

# Pull the login page attached to the passed domain and extract the version
wp_version=`curl -s "$1/wp-login.php" | grep -o -e "ver=[0-9].[0-9].[0-9]" | cut -d '=' -f 2`
# Compares the found version to the reference version
if [  "${wp_version//./}" -le "2" ]; 
	then echo "Wordpress $version found - VULNERABLE"; 
	else echo "Wordpress $version found - SECURE"; 
fi
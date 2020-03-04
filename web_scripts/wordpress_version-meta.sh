#!/bin/bash
# Simple help message for use when learning how to use the tool
if [ "$1" == "-h" ]; then
  echo "./wordpress_version-meta.sh DOMAIN_NAME WORDPRESS_VERSION(DOTS REMOVED)"
  exit 0
fi

# Pull the main page attached to the passed domain and extract the version
wp_version="$(curl -s "$1" | egrep -oi "Wordpress \d\.\d\.\d" | cut -d '=' -f 2)"
# Compares the found version to the reference version
if [  "${wp_version//./}" -le "$2" ]; 
	then echo "Wordpress $wp_version found - VULNERABLE"; 
	else echo "Wordpress $wp_version found - SECURE"; 
fi
#!/usr/bin/env bash
# Author: Ian Young
# Returns the org id into the shell

# Set to accept one argument and check against it
if [ -z = "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "This script will return the org ID into the terminal for easy copy/paste"
	exit 0
fi

# Checks if the support token was provided
if [ "$1" == "-a" ] || [ "$1" == "-auth" ] || [ "$1" == "-t" ] || [ "$1" == "--token" ]; then
	AUTH_CODE=$2
else
	AUTH_CODE=$1
fi

# Get the org ID and print it
ORG_ID=$(vtoolbox organizations.auth-code-info \
	--auth-code $AUTH_CODE | grep "organizationId" \
	| head -1 | awk -F ' ' '{print $2}' | tr -d ',"')
echo "Org ID: $ORG_ID"

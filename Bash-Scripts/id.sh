#!/usr/bin/env bash
# Author: Ian Young
# Returns the org id, user email, and user id all from the Auth token.

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "This script will return the organization id and email inside of a text file"
	echo "This is meant to be a test script since it is my first one"
	exit 0
fi

# Checks if the auth code was provided
if [ "$1" == "-a" ] || [ "$1" == "--auth" ] || [ "$1" == "-t" ] || [ "$1" == "--token" ]; then
	AUTH_CODE=$2
else
	AUTH_CODE=$1
fi

# Get the org ID
ORG_ID=$(vtb -Q --auth-code $AUTH_CODE auth-code-info | grep "organizuthationId" \
	| head -1 | awk -F ' ' '{print $2}' | tr -d ',"')
echo "Org ID: $ORG_ID"

# Get the user email
USER_EMAIL=$(vtb -Q --auth-code $AUTH_CODE auth-code-info |grep "email" | tail -1 \
	| awk -F ' ' '{print $2}' | tr -d '",')

echo "User: $USER_EMAIL"

# Return with user ID
USER_ID=$(vtb -Q --organization-id $ORG_ID list-users | tr '\n' ' ' \
	| sed "s/^..//;s/....$//;s/' b'//g" \
	| grep -o '{"email":"'"$USER_EMAIL"'","userId":"[^"]*"}' | cut -d'"' -f8)
echo "User ID: $USER_ID"

#!/usr/bin/env bash
# Author: Ian Young

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Requires -a <support token> and -o <org ID> to work properly"
	echo "Will take the support token and org ID and return all camera serial numbers in the org."
	exit 0
fi

# Checks if the auth code was provided
if [ "$1" == "-a" ] || [ "$1" == "--auth" ] || [ "$1" == "-t" ] || [ "$1" == "--token" ]; then
	AUTH_CODE=$2
else
	AUTH_CODE=$1
fi

# Check for the org ID
if [ "$3" == "-o" ] || [ "$3" == "--org" ]; then
	ORG=$4
else
	ORG=$2
fi

echo "      o8Oo./"
echo "   ._o8o8o8Oo_."
echo "    \\========/"
echo "     \`------'" 
echo ""

vtb -Q -a $AUTH_CODE -o $ORG get-all-camera-info | grep "serial" | awk -F ' ' '{print $2}' | tr -d '",'


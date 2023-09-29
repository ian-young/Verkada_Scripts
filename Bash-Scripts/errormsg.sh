#!/usr/bin/env bash
# Author: Ian Young
# Runs through a camera's dmesg command to allow for scimming of notable errors

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Runs through a camera's dmesg command to allow for scimming of notable errors"
	exit 0
fi

# Checks if the auth code was provided
if [ "$1" == "-a" ] || [ "$1" == "--auth" ] || [ "$1" == "-t" ] || [ "$1" == "--token" ]; then
	AUTH_CODE=$2
else
	AUTH_CODE=$1
fi

# Checks if the serial was provided
if [ "$3" == "-s" ] || [ "$3" == "--serial" ]; then
	SERIAL=$4
	ERRMSG=$(vtb -Q -a $AUTH_CODE -s $SERIAL dmesg | tr -d '{"}')

else
	SERIAL=$3
	ERRMSG=$(vtb -Q -a $AUTH_CODE -s $SERIAL dmesg | tr -d '{"}')

fi

# Checks if a device ID was provided
if [ "$3" == "-d" ] || [ "$3" == "--id" ]; then
	ID=$4
	ERRMSG=$(vtb -Q -a $AUTH_CODE -d $ID dmesg | tr -d '{"}')

else
	ID=$3
	ERRMSG=$(vtb -Q -a $AUTH_CODE -d $ID dmesg | tr -d '{"}')

fi

echo "Camera results:
$ERRMSG"

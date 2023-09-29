#!/usr/bin/env bash
# Author: Ian Young

basic () {
	echo "O       o O       o O       o"
	echo "| O   o | | O   o | | O   o |"
	echo "| | O | | | | O | | | | O | |"
	echo "| o   O | | o   O | | o   O |"
	echo "o       O o       O o       O"

	ID=$(vtoolbox device.lookup -s $1 | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
	echo "Camera ID: $ID"
}

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Takes a serial number (-s) and returns the device ID. Optionally, it can be ran with -l in to optimize for uploading to an array."
	exit 0
fi

if [ "$1" == "-l" ] || [ "$1" == "--list" ]; then
	if [ "$2" == " -s" ] || [ "$2" == "--serial" ]; then
		ID=$(vtoolbox device.lookup -s $3 | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
		echo "$ID"
		exit 0
	else
		ID=$(vtoolbox device.lookup -s $2 | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
		echo "$ID"
		exit 0
	fi

	ID=$(vtoolbox device.lookup -s $SERIAL | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
	echo "$ID"

fi

# Checks if the auth code was provided
if [ "$1" == "-s" ] || [ "$1" == "--serial" ] || [ "$1" == "-t" ]; then
	basic "$2"
else
	basic "$1"
fi

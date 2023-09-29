#!/usr/bin/env bash
# Author: Ian Young

basic () {
	echo "O       o O       o O       o"
	echo "| O   o | | O   o | | O   o |"
	echo "| | O | | | | O | | | | O | |"
	echo "| o   O | | o   O | | o   O |"
	echo "o       O o       O o       O"

	ID=$(vtb -Q -s $1 device-lookup | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
	echo "Camera ID: $ID"
}

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Takes a serial number (-s) and returns the device ID. Optionally, it can be ran with -l in to optimize for uploading to an array."
	exit 0
fi

# Run it in list mode.
if [ "$1" == "-l" ] || [ "$1" == "--list" ]; then
	if [ "$2" == " -s" ] || [ "$2" == "--serial" ]; then
		ID=$(vtb -Q -s $3 device-lookup | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
		echo "$ID"
		exit 0
	else
		ID=$(vtb -Q -s $2 device-lookup | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
		echo "$ID"
		exit 0
	fi

# Run with locally defined variable if no variable is given
ID=$(vtb -Q -s $SERIAL device-lookup | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
echo "$ID"

fi

# Checks if the auth code was provided
if [ "$1" == "-s" ] || [ "$1" == "--serial" ]; then
	basic "$2"
else
	basic "$1"
fi

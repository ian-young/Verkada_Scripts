#!/usr/bin/env bash
# Author: Ian Young

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Takes a serial number (-s) and returns the device ID."
	exit 0
fi

# Checks if the auth code was provided
if [ "$1" == "-a" ] || [ "$1" == "--auth" ] || [ "$1" == "-t" ] || [ "$1" == "--token" ]; then
	SERIAL=$2
else
	SERIAL=$1
fi

echo "O       o O       o O       o"
echo "| O   o | | O   o | | O   o |"
echo "| | O | | | | O | | | | O | |"
echo "| o   O | | o   O | | o   O |"
echo "o       O o       O o       O"

ID=$(vtoolbox device.lookup -s $SERIAL | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
echo "Camera ID: $id"
end


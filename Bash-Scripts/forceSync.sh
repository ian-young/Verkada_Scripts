#!/usr/bin/evn bash
# Author: Ian Young
# Force an NTP sync between the camera and NTP servers

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Set to accept one argument and check it"
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
	SYNC=$(vtoolbox remotesh.ntpdate -a $AUTH_CODE -s $SERIAL | tr -d '{"}')
else
	SERIAL=$3
	SYNC=$(vtoolbox remotesh.ntpdate -a $AUTH_CODE -s $SERIAL | tr -d '{"}')
fi

# Checks if the device ID was provided
if [ "$3" == "-d" ] || [ "$3" == "--id" ]; then
	ID=$4
	SYNC=$(vtoolbox remotesh.ntpdate -a $AUTH_CODE -d $ID | tr -d '{"}')
else
	ID=$3
	SYNC=$(vtoolbox remotesh.ntpdate -a $AUTH_CODE -d $ID | tr -d '{"}')
fi
echo "Results: $sync"
echo "Finished"

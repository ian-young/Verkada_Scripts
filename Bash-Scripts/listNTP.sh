#!/usr/bin/env bash
# Author: Ian Young

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "This script will take a support token and camera serial number and return all of the ntp servers that are associated with it."
	exit 0
fi

# Checks if the auth code was provided
if [ "$1" == "-a" ] || [ "$1" == "--auth" ] || [ "$1" == "-t" ] || [ "$1" == "--token" ]; then
	AUTH_CODE=$2
else
	AUTH_CODE=$1
fi

if [ "$3" == "-s" ] || [ "$3" == "--serial" ]; then
	SERIAL=$4
	NTP_SERVERS=$(vtoolbox remotesh.list-ntp -a $AUTH_CODE -s $SERIAL)
else
	SERIAL=$3
	NTP_SERVERS=$(vtoolbox remotesh.list-ntp -a $AUTH_CODE -s $SERIAL)
fi

if [ "$3" == "-d" ] || [ "$3" == "--id" ]; then
	SERIAL=$4
	NTP_SERVERS=$(vtoolbox remotesh.list-ntp -a $AUTH_CODE -d $ID)
else
	SERIAL=$3
	NTP_SERVERS=$(vtoolbox remotesh.list-ntp -a $AUTH_CODE -d $ID)
fi

echo "$NTP_SERVERS"

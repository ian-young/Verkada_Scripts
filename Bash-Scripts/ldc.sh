#!/usr/bin/env bash
# Author: Ian Young
# Store booleans as integers to save memory and to save on comparison times

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Will toggle LDC based on the toggle that is inputted (y/n)"
	echo "Takes -s <support token>, -d <device ID> OR -s <serial>, and -t <y/n>"
	exit 0
fi

# Checks if the auth code was provided
if [ "$1" == "-a" ] || [ "$1" == "--auth" ] || [ "$1" == "-t" ] || [ "$1" == "--token" ]; then
	AUTH_CODE=$2
else
	AUTH_CODE=$1
fi


DEVICE_ID=0 # Assume that device ID is not being provided

# Checks if the device ID or serial number was given
if [ "$3" == "-d" ] || [ "$3" == "--device" ]; then
	DEVICE=$4
	DEVICE_ID=1
else
	DEVICE=$2
	DEVICE_ID=1
fi
if [ "$3" == "-s" ] || [ "$3" == "--serial" ]; then
	DEVICE=$4
else
	DEVICE=$2
fi

# Checks the toggle (Should always be in the third place since both ID and s/n cannot coexist
TOGGLE="false" # Needs to be a string since vtoolbox only acccepts strings for the toggle
REBOOT=0 # Determines if a camera reboot is required

if [ "$5" == "-t" ] || [ "$5" == "--toggle" ]; then
	if [ "$6" == "y" ]; then
		TOGGLE="true"
	elif [ "$6" == "n" ]
		REBOOT=1
	fi
else
	if [ "$3" == "y" ]; then
		TOGGLE="true"
	elif [ "$3" == "n" ]
		REBOOT=1
	else
		echo "Please provide a valid toggle switch (-t <y/n>)"
		exit 0
	fi
fi

if [ $DEVICE_ID == 1 ]; then
	vtoolbox device.set-device-config -u $AUTH_CODE -d $DEVICE -p 'camera-config.lds-enable' "$TOGGLE"
	
	if [ $REBOOT == 1 ]; then
		vtoolbox remotesh.reboot -a $AUTH_CODE -d $DEVICE
	fi
else
	vtoolbox device.set-device-config -u $AUTH_CODE -s $DEVICE -p 'camera-config.ldc-enable' "$TOGGLE"
	
	if [ $REBOOT == 1 ]; then
		vtoolbox remotesh.reboot -a $AUTH_CODE -s $DEVICE
	fi
fi

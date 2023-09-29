#!/usr/bin/env bash
#!/bin/bash
# Author: Ian Young

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	# Help text
	echo "This command my be ran stand alone or with the arguments for the support token and camera serial number."
	echo "vtb -a <auth_code> -s <camera_serial> ifconfig"
	echo "---------------------------------------------------"

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
else
	SERIAL=$3
fi


	echo "	    ______________
	   /             /|
	  /             / |
	 /____________ /  |
	|  _________  |   |____________________
	| |         | |   |/        /|,       /|
	| |     ..  | |   /        / /9      / |
	| |  .      | |  /_______ / /9      /  |
	| |_________| | |  ____ +| /9      /   |
	|________++___|/|________|/9      /    |
	   ________________     ,9\`      /   / |
	  /  -/      /-   /|  ,9        /   /| |
	 /______________ //|,9         /   / | |
	|       ______  ||,9          /   /  | |
	|  -+  |_9366_| ||/          /   /|  | |
	|_______________|/__________/   / |  | |
	/////----------/|           |  /__|  | |___
	|o     o  \o|  \|           |  |  |  | |
	|o    \|_  ||  o|______     |  |__|  | |_____
	|o \_  |   ||  o|      |    |  |  |  | /
	|o /   |\  /|  o|      |    |  |  |__|/
	|o             o|      |    |  |
	|o-------------o|      |    |  |
	|o   /\/\      o|      |    |  |
	|o  / o o|     o|      |    |  |
	|o / \_+_/     o|      |    |  |
	|o |\     \    o|      |    |  |
	|o | |+ +-|    o|      |    |  |
	|o-------------o|      |    |  |
	|o     /|      o|      |    | /   m1a
	 \/|/|/ |/\/|/\/       |____|/
 ---------------------------------------------------"
 	
 RESULTS=$(vtb -a $argv[1] -s $argv[2] ifconfig \
	| grep -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
 echo "$RESULTS"


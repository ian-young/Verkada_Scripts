#!/usr/bin/env bash
# Author: Ian Young

# Set to accept one argument and check it
# Tests all endpoints that a camera should be connected to

# List of camera approved endpoints
URLS=("https://access.control.verkada.com/ping" "https://api.command.verkada.com/valarm/ping" "https://api.command.verkada.com/vconductor/ping" "https://api.control.verkada.com/ping" "https://firmware.control.verkada.com/ping" "https://index.control.verkada.com/ping" "https://relay.control.verkada.com/ping" "https://update.control.verkada.com/ping" "https://valarm.command.verkada.com/ping" "https://vcerberus.command.verkada.com/ping" "https://vconductor.command.verkada.com/ping" "https://vecho.command.verkada.com/ping" "https://vprovision.command.verkada.com/ping" "https://vsensor.command.verkada.com/ping" "https://s3.us-west-004.backblazeb2.com" "https://s3.eu-central-003.backblazeb2.com")
COUNTER=0
ARRAY_LENGTH=${#URLS[@]}

# Some fun art that makes it easier to find when scrolling
echo " _|_|_|_|  _|      _|  _|_|_|    _|_|_|      _|_|    _|_|_|  _|      _|  _|_|_|_|_|    _|_|_|  
 _|        _|_|    _|  _|    _|  _|    _|  _|    _|    _|    _|_|    _|      _|      _|        
 _|_|_|    _|  _|  _|  _|    _|  _|_|_|    _|    _|    _|    _|  _|  _|      _|        _|_|    
 _|        _|    _|_|  _|    _|  _|        _|    _|    _|    _|    _|_|      _|            _|  
 _|_|_|_|  _|      _|  _|_|_|    _|          _|_|    _|_|_|  _|      _|      _|      _|_|_|   "
echo "---------------------------------------------------------" # Gives a clean look to the output

if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "This script will return the organization id and email inside of a text file."
	echo "This is meant to be a test script since it is my first one."
	echo "Takes two arguments: -a <auth token> -s <serial number>"
	echo "As a side note, it is okay, and expected to have the dashes in the serial number."
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
	
	# Run throught the array of endpoints and and output the raw results
	for URL in "${URLS[@]}"
		do	
			echo " "
			RESULTS=$(vtoolbox remotesh.curl -a $AUTH_CODE -s $SERIAL -u $URL | tr -d '{["]}\n')
	
			if [ -z "$RESULTS" ]; then
				echo "$URL FAILED"
			else	
				let COUNTER++
			fi
	
			echo "$URL response: $RESULTS"
			echo "---------------------------------------------------------"
		done
else
	SERIAL=$3
	
	# Run throught the array of endpoints and and output the raw results
	for URL in "${URLS[@]}"
		do	
			echo " "
			RESULTS=$(vtoolbox remotesh.curl -a $AUTH_CODE -s $SERIAL -u $URL | tr -d '{["]}\n')
	
			if [ -z "$RESULTS" ]; then
				echo "$URL FAILED"
			else	
				let COUNTER++
			fi
	
			echo "$URL response: $RESULTS"
			echo "---------------------------------------------------------"
		done
fi

if [ "$3" == "-d" ] || [ "$3" == "--id" ] || [ "$3" == "-c" ];then
	ID=$4
	
	# Run throught the array of endpoints and and output the raw results
	for URL in "${URLS[@]}"
		do	
			echo " "
			RESULTS=$(vtoolbox remotesh.curl -a $AUTH_CODE -d $ID -u $URL | tr -d '{["]}\n')
	
		if [ -z "$RESULTS" ]; then
			echo "$URL FAILED"
		else	
			let COUNTER++
		fi
	
		echo "$URL response: $RESULTS"
		echo "---------------------------------------------------------"
	done
else
	ID=$3
	
	# Run throught the array of endpoints and and output the raw results
	for URL in "${URLS[@]}"
		do	
			echo " "
			RESULTS=$(vtoolbox remotesh.curl -a $AUTH_CODE -d $ID -u $URL | tr -d '{["]}\n')
	
		if [ -z "$RESULTS" ]; then
			echo "$URL FAILED"
		else	
			let COUNTER++
		fi
	
		echo "$URL response: $RESULTS"
		echo "---------------------------------------------------------"
	done
fi
echo "Finished $COUNTER/$ARRAY_LENGTH"

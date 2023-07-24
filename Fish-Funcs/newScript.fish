#!/usr/bin/env bash
# Author: Ian Young
# Injects the needed code to start a new script
function newScript -d 'Injects the needed code to start a new script' -a file
echo '#!/usr/bin/env bash
# Author: Ian Young

# Set to accept one argument and check it
if [ -z "$1" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "DESCRIPTION HERE"
	exit 0
fi

# Checks if the auth code was provided
if [ "$1" == "-a" ] || [ "$1" == "--auth" ] || [ "$1" == "-t" ] || [ "$1" == "--token" ]; then
	AUTH_CODE=$2
else
	AUTH_CODE=$1
fi' >> $file
end

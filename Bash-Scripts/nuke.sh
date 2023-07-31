#!/usr/bin/env bash
# Author: Ian Young


Lower () {
	# Converts a given String to lowecase
	out=$(echo "$1" | tr '[:upper:]' '[:lower:]')
	echo "$out"
}


cameraSnapshot () {
	# Takes snapshot of current device settings and saves them to a file

	toWrite=$(vtoolbox remotesh,cat /mnt/config/config -s $1 | tr , \\n | tr -d '"{,}')

	sample=$($toWrite | head -1)

	# Check if it is an internal org
	if [ "$sample" == "This is an operation on an internal organization" ]; then
		toWrite=$($toWrite | tail -n +3)
	fi
	
	# Clear the sample from memory
	unset sample

	echo "$toWrite" >> cameras.setting
}


nukeOrg () {
# Runs the script to reset an org to a snapshot
	echo ""
	echo "     _.-^^---....,,--._"       
	echo " _--                   -- _"  
	echo "<                          >)"
	echo "|                           |" 
	echo " \._                    _./"  
	echo "    \```--. . , ; .--'''"       
	echo "          | |   |"             
	echo "       .-=||  | |=-."   
	echo "       \`-=#$%&%\$#=-'"   
	echo "          | ;  :|"     
	echo " _____.,-#%&\$@%#&#~,._____"
	echo ""

	if [ -f cameras.setting ]; then
		# If a snapshot file exists, use it
		devices="$(vtoolbox oganizations.get-all-camera-info -a $AUTH_CODE -o $ORG | grep "serial" \
			| awk -F ' ' '{print $2}' | tr -d '",')"

		for device in $devices
		do
			vtoolbox remotesh.reset-zoom-and-autofocus -d $device -a $auth
		done
	else
		# Use factory default values
		devices="$(vtoolbox oganizations.get-all-camera-info -a $AUTH_CODE -o $ORG | grep "serial" \
			| awk -F ' ' '{print $2}' | tr -d '",')"

		for device in $devices
		do
			vtoolbox remotesh.reset-zoom-and-autofocus -d $device -a $auth

			# Start camera config (dome default)
			vtoolbox set-device-config -u $auth -d $device -p \
				'http-proxy.backup-aws' 'https://s3.us-west-2.amazonaws.com'
			vtoolbox set-device-config -u $auth -d $device -p 'backup-bb' 'https://s3.us-west-004.backblazeb2.com'
			vtoolbox set-device-config -u $auth -d $device -p 'loggly' 'https://api.control.verkada.com/logs/relay'
			vtoolbox set-device-config -u $auth -d $device -p 'vauth' 'https://api.control.verkada.com/device/auth'
			vtoolbox set-device-config -u $auth -d $device -p 'vcameramgmt' 'https://api.control.verkada.com/manage'
			vtoolbox set-device-config -u $auth -d $device -p 'vflow' 'wss://relay.control.verkada.com/flow/'
			vtoolbox set-device-config -u $auth -d $device -p \
				'vhistory' 'wss://relay.control.verkada.com/vhistory/camera'
			vtoolbox set-device-config -u $auth -d $device -p 'vospery' 'https://relay.control.verkada.com/vosprey'
			vtoolbox set-device-config -u $auth -d $device -p 'vprovision' 'https://api.control.verkada.com'
			vtoolbox set-device-config -u $auth -d $device -p 'vproxy' 'https://relay.control.verkada.com'
			vtoolbox set-device-config -u $auth -d $device -p 'vstream' 'wss://relay.control.verkada.com/stream'
			vtoolbox set-device-config -u $auth -d $device -p 'vsubmit' 'https://index.control.verkada.com'
			vtoolbox set-device-config -u $auth -d $device -p 'motion-threshold' '120'
			vtoolbox set-device-config -u $auth -d $device -p 'object-tracking-hz-interval-high-quality' '8000'
			vtoolbox set-device-config -u $auth -d $device -p 'object-tracking-hz-interval-low-quality' '60000'
			vtoolbox set-device-config -u $auth -d $device -p 'object-tracking-max-lost-tracklet-age' '20'
			vtoolbox set-device-config -u $auth -d $device -p 'object-tracking-movement-threshold-low-quality' '0.899'
			vtoolbox set-device-config -u $auth -d $device -p 'person-crop-threshold' '0.83'
			vtoolbox set-device-config -u $auth -d $device -p 'person-intrusion-threshold' '0.5'
			vtoolbox set-device-config -u $auth -d $device -p 'person-send-full-frame-threshold' '0.8'
			vtoolbox set-device-config -u $auth -d $device -p 'vehicle-intrusion-threshold' '0.5'
			vtoolbox set-device-config -u $auth -d $device -p 'vehicle-send-full-frame-threshold' '0.75'
			vtoolbox set-device-config -u $auth -d $device -p 'vproxy-url' 'relay.control.verkada.com'
			vtoolbox set-device-config -u $auth -d $device -p 'image-processing.image-night-ae-compensation' '100'
			vtoolbox set-device-config -u $auth -d $device -p 'low-lux-mode-off-thresh' '8'
			vtoolbox set-device-config -u $auth -d $device -p 'max-shutter-time-hyperzoom-hz' '60'
			vtoolbox set-device-config -u $auth -d $device -p 'night-max-shutter-time-hyperzoom-hz' '60'
			vtoolbox set-device-config -u $auth -d $device -p \
				'motion-search.detection-person-confidence-threshold' '0.68'
			vtoolbox set-device-config -u $auth -d $device -p 'detection-vehicle-confidence-threshold' '0.6'
			vtoolbox set-device-config -u $auth -d $device -p 'camera-rotate' '180'
			vtoolbox set-device-config -u $auth -d $device -p 'rtsp.max-viewers' '2'
			vtoolbox set-device-config -u $auth -d $device -p 'release-info.channel' 'customer-stable'
			vtoolbox set-device-config -u $auth -d $device -p 'stats-monitor-config.system-stats-window' '180'
			vtoolbox set-device-config -u $auth -d $device -p 'storage-manage.cloud-backup-location' 'b2'
			vtoolbox set-device-config -u $auth -d $device -p 'stream-configs.high.stream-encoding' 'HEVC'
			vtoolbox set-device-config -u $auth -d $device -p 'low.stream-encoding' 'HEVC'
			vtoolbox set-device-config -u $auth -d $device -p 'cloud-backup-presigned-timeout' '60'
			vtoolbox set-device-config -u $auth -d $device -p 'record-on-motion-expansion' '5'
			vtoolbox set-device-config -u $auth -d $device -p 'thumbnail-repeat-interval' '300'
			vtoolbox set-device-config -u $auth -d $device -p 'vda.motion-notification-divisor' '4'
			vtoolbox set-device-config -u $auth -d $device -p 'vstream.high.enabled' 'false'
			echo "End of camera reset. LDC should be rest individually since it requires the device to reboot."
			# End of camera config (dome default)
		done
	fi
}


input=""
working="Working    |" "wOrking.   \\" "woRking..  -" "worKing... |" "workIng..  /" "workiNg.   -" "workingG    |" 

# Set to accept one argument and check it
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "PLEASE EXERCISE CAUTION WHEN EXECUTING THIS SCRIPT!"
	echo "This script will reset all device settings to default"
	echo "The snapshot will save the camera's configuration to your local device."
	exit 0
fi

echo -e "1. Create snapshot\n2. Nuke org"

until [ "$input" == "1" ] || [ "$input" == "2" ]; do
	read -p "Choice: "
done

case $input
	"1")
		until [ "${#input}" ==  "14" ]; do
			read -p "Please enter the camera's serial number you'd like to take a snapshot of: " input
		done

		cameraSnapshot $input
	;;
	
	"2")
		until [ "$input" == "y" ] || [ "$input" == "n" ]; do
			read -p "Do you want to nuke this org: $orgID? (y/n) " input
			input="$(Lower $input)"
		done

		if [ "$input" == "y" ]; then
			input="" # Reset user input
			until [ "$input" == "y" ] || [ "$input" == "n" ]; do
				read -p "Are you sure? (y/n) " input
				input="$(Lower $input)"
			done
			if [ "$input" == "n" ]; then 
				exit 0
			fi
		else
			exit 0
		fi
		
		# Clear user input from memory
		unset input

		while [ nukeOrg ] do
			for anime in "${working[@]}"
			do
				echo -ne "\b$anime"
				sleep 0.1
			done
		done
		echo -ne "\bFinished!"
	;;
esac


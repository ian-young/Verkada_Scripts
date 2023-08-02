#!/usr/bin/env bash
# Author: Ian Young
# Multi-threading is a future project. The script in its current state will run slowly due to vToolbox.
# After testing of the script's functionality in its single-thread state is proven, multi-threading will be implemented.


Lower () {
	# Converts a given String to lowecase
	out=$(echo "$1" | tr '[:upper:]' '[:lower:]')
	echo "$out"
}


cameraSnapshot () {
	# Takes snapshot of current device settings and saves them to a file
	
	if [ -f cameras.setting ]; then
		echo "Rewriting snapshot file"
		rm cameras.setting
	else
		echo "Creating a new snapshot"
	fi

	toWrite=$(vtoolbox remotesh.cat /mnt/config/config -s $1 | tr , '\n' | tr -d '"{,}')

	sample=$(echo "$toWrite" | head -1)

	# Check if it is an internal org
	if [ "$sample" == "This is an operation on an internal organization" ]; then
		toWrite=$(echo "$toWrite" | tail -n +3)
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
		devices="$(vtoolbox oganizations.get-all-camera-info -a $auth -o $org | grep "serial" \
			| awk -F ' ' '{print $2}' | tr -d '",')"
		walker="" # Will walk through the snapshot file and pull values
		for device in $devices
		do
			# Reset the zoom and af of the camera
			vtoolbox remotesh.reset-zoom-and-autofocus -d $device -a $auth

			# Start camera config (snapshot)
			walker=$(cat cameras.setting | grep http-proxy | awk -F ':' '{print $4}')
			vtoolbox set-device-config -u $auth -d $device -p 'http-proxy.backup-aws' "https:$walker"
			walker=$(cat cameras.setting | grep backup-bb | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'backup-bb' "https:$walker"
			walker=$(cat cameras.setting | grep loggly | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'loggly' "https:$walker"
			walker=$(cat cameras.setting | grep vauth | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'vauth' "https:$walker"
			walker=$(cat cameras.setting | grep vcameramgmt | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'vcameramgmt' "https:$walker"
			walker=$(cat cameras.setting | grep vflow | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'vflow' "wss:$walker"
			walker=$(cat cameras.setting | grep vhistory | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'vhistory' "wss:$walker"
			walker=$(cat cameras.setting | grep vosprey | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'vosprey' "https:$walker"
			walker=$(cat cameras.setting | grep vprovision | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'vprovision' "https:$walker"
			walker=$(cat cameras.setting | grep vproxy | awk -F ':' '{print $3}' | head -1)
			vtoolbox set-device-config -u $auth -d $device -p 'vproxy' "https:$walker"
			walker=$(cat cameras.setting | grep vstream | awk -F ':' '{print $3}' | head -1)
			vtoolbox set-device-config -u $auth -d $device -p 'vstream' "wss:$walker"
			walker=$(cat cameras.setting | grep vsubmit | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'vsubmit' "https:$walker"
			walker=$(cat cameras.setting | grep vsubmit | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'motion-threshold' "$walker"
			walker=$(cat cameras.setting | grep object-tracking-hz-interval-high-quality | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'object-tracking-hz-interval-high-quality' "$walker"
			walker=$(cat cameras.setting | grep object-tracking-hz-interval-low-quality | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'object-tracking-hz-interval-low-quality' "$walker"
			walker=$(cat cameras.setting | grep object-tracking-max-lost-tracklet-age | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'object-tracking-max-lost-tracklet-age' "$walker"
			walker=$(cat cameras.setting | grep object-tracking-movement-threshold-low-quality| awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'object-tracking-movement-threshold-low-quality' "$walker"
			walker=$(cat cameras.setting | grep person-crop-threshold | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'person-crop-threshold' "$walker"
			walker=$(cat cameras.setting | grep person-intrusion-threshold | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'person-intrusion-threshold' "$walker"
			walker=$(cat cameras.setting | grep person-send-full-frame-threshold | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'person-send-full-frame-threshold' "$walker"
			walker=$(cat cameras.setting | grep vehicle-intrusion-threshold | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'vehicle-intrusion-threshold' "$walker"
			walker=$(cat cameras.setting | grep vehicle-send-full-frame-threshold | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'vehicle-send-full-frame-threshold' "$walker"
			walker=$(cat cameras.setting | grep vprox-url | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'vproxy-url' "$walker"
			walker=$(cat cameras.setting | grep image-night-ae-compensation | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'image-processing.image-night-ae-compensation' "$walker"
			walker=$(cat cameras.setting | grep low-lux-mode-off-thresh | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'low-lux-mode-off-thresh' "$walker"
			walker=$(cat cameras.setting | grep max-shutter-time-hyperzoom-hz | awk -F ':' '{print $2}' | head -1)
			vtoolbox set-device-config -u $auth -d $device -p 'max-shutter-time-hyperzoom-hz' "$walker"
			walker=$(cat cameras.setting | grep max-shutter-time-hyperzoom-hz | awk -F ':' '{print $2}' | tail -1)
			vtoolbox set-device-config -u $auth -d $device -p 'night-max-shutter-time-hyperzoom-hz' "$walker"
			walker=$(cat cameras.setting | grep detection-person-confidence-threshold | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p \
				'motion-search.detection-person-confidence-threshold' "$walker"
			walker=$(cat cameras.setting | grep detection-vehicle-confidence-threshold | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'detection-vehicle-confidence-threshold' "$walker"
			walker=$(cat cameras.setting | grep camera-rotate | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'camera-rotate' "$walker"
			walker=$(cat cameras.setting | grep max-viewers | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'rtsp.max-viewers' "$walker"
			walker=$(cat cameras.setting | grep channel | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'release-info.channel' "$walker"
			walker=$(cat cameras.setting | grep system-stats-window | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'stats-monitor-config.system-stats-window' "$walker"
			walker=$(cat cameras.setting | grep cloud-backup-location | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'storage-manage.cloud-backup-location' "$walker"
			walker=$(cat cameras.setting | grep stream-encoding | awk -F ':' '{print $4}' | head -1)
			vtoolbox set-device-config -u $auth -d $device -p 'stream-configs.high.stream-encoding' "$walker"
			walker=$(cat cameras.setting | grep stream-encoding | awk -F ':' '{print $3}' | tail -1)
			vtoolbox set-device-config -u $auth -d $device -p 'low.stream-encoding' "$walker"
			walker=$(cat cameras.setting | grep cloud-backup-presigned-timeout | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'cloud-backup-presigned-timeout' "$walker"
			walker=$(cat cameras.setting | grep record-on-motion-expansion | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'record-on-motion-expansion' "$walker"
			walker=$(cat cameras.setting | grep thumbnail-repeat-interval | awk -F ':' '{print $2}')
			vtoolbox set-device-config -u $auth -d $device -p 'thumbnail-repeat-interval' "$walker"
			walker=$(cat cameras.setting | grep motion-notification-divisor | awk -F ':' '{print $3}')
			vtoolbox set-device-config -u $auth -d $device -p 'vda.motion-notification-divisor' "$walker"
			walker=$(cat cameras.setting | grep | awk -F ':' '{print $4}' | tail -1)
			vtoolbox set-device-config -u $auth -d $device -p 'vstream.high.enabled' "$walker"
			echo "End of camera reset for $device."	
		done
		# End of camera config (snapshot)
		unset walker
	else
		# Use factory default values if no snapshot file is found
		devices="$(vtoolbox oganizations.get-all-camera-info -a $auth -o $org | grep "serial" \
			| awk -F ' ' '{print $2}' | tr -d '",')"
		echo "LDC should be rest individually since it requires the device to reboot."
		for device in $devices
		do
			# Reset zoom and af of the camera
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
			echo "End of camera reset for camera $device."
			# End of camera config (dome default)
		done
	fi
}


nuke () {
# Driver function
	input=""
	working=('Working    |' 'wOrking.   \' 'woRking..  -' 'worKing... |' 'workIng..  /' 'workiNg.   -' 'workingG   |')

	if [ -z "$auth" ]; then
		notSet="Not provided"
	else
		notSet="Provided"
	fi

	echo -e "1. Create snapshot\n2. Nuke org\n3. Set variables\ne. Exit\n\nAuth code: $notSet\norg ID: $org\n"

	until [ "$input" == "1" ] || [ "$input" == "2" ] || [ "$input" == "3" ] || [ "$input" == "e" ]; do
		read -p "Choice: " input
	done

	unset notSet

	case $input in
		1)
			until [ "${#input}" ==  "14" ]; do
				read -p "Please enter the camera's serial number you'd like to take a snapshot of: " input
			done
			
			cameraSnapshot "$input" &
			pid=$! # Grab the function's PID
			sleep 0.2 # Let the function print

			while kill -0 "$pid" 2>/dev/null; do
				for anime in "${working[@]}"
				do
					echo -ne "\r$anime"
					sleep 0.1
				done
			done
			wait "$pid" # Wait for the process to finish
			echo -ne "\rFinished!"

		;;
		
		2)
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
			
			nukeOrg &
			pid=$!

			while kill -0 "$pid" 2>/dev/null; do
				for anime in "${working[@]}"
				do
					echo -ne "\r$anime"
					sleep 0.1
				done
			done
			wait "$pid" # Wait for the process to finish
			echo -ne "\rFinished!"
			exit 0
		;;

		3)
			input="" # Clear input
			stay=false
			while [ "$stay" == "false" ];do
				until [ "$input" = "1" ] || [ "$input" == "2" ] || [ "$input" == "e" ]; do
					echo -e "Set:\n1. auth code\n2. org ID\ne. leave"
					read -p "- " input
					input=$(Lower "$input")
				done
				if [ "$input" == "1" ]; then
					read -p "Set auth code to: " input
					auth=$input
				elif [ "$input" == "2" ]; then
					read -p "Set org ID to: " input
					org=$input
				elif [ "$input" == "e" ]; then
					echo -e "Returning...\n"
					nuke # Self call
				else
					echo "An error has ocurred"
					exit 1
				fi
			done
		;;

		e)
			echo "Leaving..."
			exit 0
		;;
	esac
}


# Set to accept one argument and check it
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "PLEASE EXERCISE CAUTION WHEN EXECUTING THIS SCRIPT!"
	echo "This script will reset all device settings to default"
	echo "The snapshot will save the camera's configuration to your local device."
	exit 0
fi

nuke

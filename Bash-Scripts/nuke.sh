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
	echo "LDC should be reset individually since it requires the device to reboot."
	if [ -f cameras.setting ]; then
		# If a snapshot file exists, use it
		cameras="$(vtoolbox organizations.get-all-camera-info -a $auth -o $org | grep "serial" \
			| awk -F ' ' '{print $2}' | tr -s '",')"
		walker="" # Will walk through the snapshot file and pull values
		for camera in $cameras
		do
			# Reset the zoom and af of the camera
			vtoolbox remotesh.reset-zoom-and-autofocus -s $camera -a $auth

			# Start camera config (snapshot)
			walker=$(cat cameras.setting | grep http-proxy | awk -F ':' '{print $4}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.backup-aws' "https:$walker" >> dev/null
			walker=$(cat cameras.setting | grep backup-bb | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.backup-bb' "https:$walker" >> dev/null
			walker=$(cat cameras.setting | grep loggly | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.loggly' "https:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vauth | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vauth' "https:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vcameramgmt | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vcameramgmt' "https:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vflow | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vflow' "wss:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vhistory | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vhistory' "wss:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vosprey | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vosprey' "https:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vprovision | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vprovision' "https:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vproxy | awk -F ':' '{print $3}' | head -1)
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vproxy' "https:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vstream | awk -F ':' '{print $3}' | head -1)
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vstream' "wss:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vsubmit | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vsubmit' "https:$walker" >> dev/null
			walker=$(cat cameras.setting | grep vsubmit | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.motion-threshold' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep object-tracking-hz-interval-high-quality | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.object-tracking-hz-interval-high-quality' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep object-tracking-hz-interval-low-quality | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.object-tracking-hz-interval-low-quality' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep object-tracking-max-lost-tracklet-age | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.object-tracking-max-lost-tracklet-age' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep object-tracking-movement-threshold-low-quality | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.object-tracking-movement-threshold-low-quality' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep person-crop-threshold | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.person-crop-threshold' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep person-intrusion-threshold | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.person-intrusion-threshold' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep person-send-full-frame-threshold | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.person-send-full-frame-threshold' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep vehicle-intrusion-threshold | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.vehicle-intrusion-threshold' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep vehicle-send-full-frame-threshold | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.vehicle-send-full-frame-threshold' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep vprox-url | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p 'vproxy-url' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep image-night-ae-compensation | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'image-processing.image-night-ae-compensation' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep low-lux-mode-off-thresh | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'image-processing.low-lux-mode-off-thresh' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep max-shutter-time-hyperzoom-hz | awk -F ':' '{print $2}' | head -1)
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'image-processing.max-shutter-time-hyperzoom-hz' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep max-shutter-time-hyperzoom-hz | awk -F ':' '{print $2}' | tail -1)
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'image-processing.night-max-shutter-time-hyperzoom-hz' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep detection-person-confidence-threshold | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'motion-search.detection-person-confidence-threshold' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep detection-vehicle-confidence-threshold | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'motion-search.detection-vehicle-confidence-threshold' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep max-viewers | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'rtsp.max-viewers' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep channel | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'release-info.channel' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep system-stats-window | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'stats-monitor-config.system-stats-window' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep cloud-backup-location | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'storage-manage.cloud-backup-location' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep stream-encoding | awk -F ':' '{print $4}' | head -1)
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'stream-configs.high.stream-encoding' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep stream-encoding | awk -F ':' '{print $3}' | tail -1)
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'low.stream-encoding' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep cloud-backup-presigned-timeout | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'storage-manager.cloud-backup-presigned-timeout' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep record-on-motion-expansion | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'storage-manager.record-on-motion-expansion' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep thumbnail-repeat-interval | awk -F ':' '{print $2}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'storage-manager.thumbnail-repeat-interval' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep motion-notification-divisor | awk -F ':' '{print $3}')
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'stream-configs.vda.motion-notification-divisor' "$walker" >> dev/null
			walker=$(cat cameras.setting | grep | awk -F ':' '{print $4}' | tail -1)
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'vstream.high.enabled' "$walker"
			echo -e "\nEnd of camera reset for $camera."	
		done
		# End of camera config (snapshot)
		unset walker
	else
		# Use factory default values if no snapshot file is found
		cameras="$(vtoolbox organizations.get-all-camera-info -a $auth -o $org | grep "serial" \
			| awk -F ' ' '{print $2}' | tr -d '",')"
		for camera in $cameras
		do
			# Reset zoom and af of the camera
			vtoolbox remotesh.reset-zoom-and-autofocus -s $camera -a $auth

			# Start camera config (dome default)
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.backup-aws' 'https://s3.us-west-2.amazonaws.com' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.backup-bb' 'https://s3.us-west-004.backblazeb2.com' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.loggly' 'https://api.control.verkada.com/logs/relay' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vauth' 'https://api.control.verkada.com/device/auth' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vcameramgmt' 'https://api.control.verkada.com/manage' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vflow' 'wss://relay.control.verkada.com/flow/'
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vhistory' 'wss://relay.control.verkada.com/vhistory/camera' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vosprey' 'https://relay.control.verkada.com/vosprey' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vprovision' 'https://api.control.verkada.com' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vproxy' 'https://relay.control.verkada.com' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vstream' 'wss://relay.control.verkada.com/stream' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'http-proxy.vsubmit' 'https://index.control.verkada.com' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.motion-threshold' '120' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.object-tracking-hz-interval-high-quality' '8000' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.object-tracking-hz-interval-low-quality' '60000' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.object-tracking-max-lost-tracklet-age' '20' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.object-tracking-movement-threshold-low-quality' '0.899' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.person-crop-threshold' '0.83' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.person-intrusion-threshold' '0.5' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.person-send-full-frame-threshold' '0.8' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.vehicle-intrusion-threshold' '0.5' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'cvproc-hyperzoom.vehicle-send-full-frame-threshold' '0.75' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'image-processing.image-night-ae-compensation' '100' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'image-processing.low-lux-mode-off-thresh' '8' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'image-processing.max-shutter-time-hyperzoom-hz' '60' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'image-processing.night-max-shutter-time-hyperzoom-hz' '60' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'motion-search.detection-person-confidence-threshold' '0.68' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'motion-search.detection-vehicle-confidence-threshold' '0.6' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'rtsp.max-viewers' '2' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'release-info.channel' 'customer-stable' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'stats-monitor-config.system-stats-window' '180' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'stream-configs.high.stream-encoding' 'HEVC' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'stream-configs.low.stream-encoding' 'HEVC'  >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'storage-manager.cloud-backup-presigned-timeout' '60' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'storage-manager.record-on-motion-expansion' '5' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'storage-manager.thumbnail-repeat-interval' '300' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'stream-configs.vda.motion-notification-divisor' '4' >> dev/null
			vtoolbox device.set-device-config -u $auth -s $camera -p \
			'vstream.high.enabled' 'false' >> dev/null
			echo -e "\nEnd of camera reset for camera $camera."
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

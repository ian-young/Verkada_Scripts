function ldc --description 'Allows you to easily toggle LDC on a camera. Will run with serial unless "-d" is given for an ID' -a AUTH SERIAL DEVICE TOGGLE
	set REBOOT False
	if test (count $argv) = 1
		echo "Toggle only mode"
		if test "$argv[1]" = "n"
			echo "LDC off"
			vtb -u $auth -s $serial set-device-config -p 'camera-config.ldc-enable' 'false'
		else if test "$argv[1]" = "y"
			echo "LDC on"
			vtb -Q -u $auth -s $serial set-device-config -p 'camera-config.ldc-enable' 'true'
			vtb -Q -a $auth -s $serial reboot
		else
			echo "Please provide y/n"
		end
	else if test (count $argv) = 3
		if test "$argv[3]" = "y"
			set LDC true
			set REBOOT True
		else if test "$argv[3]" = "n"
			set LDC false
		else
			echo "Please provide y/n"
			exit 0
		end
		# echo "Would run with $argv[1], $argv[2], $LDC"
		vtb -Q -u $argv[1] -s $argv[2] set-device-config -p 'camera-config.ldc-enable' "$LDC"
	else if test (count $argv) = 4
		if test "$argv[2]" = "-d"
			if test "$argv[4]" = "y"
				set LDC true
				set REBOOT True
			if test "$REBOOT" = "True"
				vtb -Q -a $argv[1] -d $argv[3] reboot
			end
			else if test "$argv[4]" = "n"
				set LDC false
			else
				echo "Please provide y/n"
				exit 0
			end
			# echo "Would run with $argv[1], $argv[3], $LDC"
			vtb -Q -u $argv[1] -d $argv[3] set-device-config -p 'camera-config.ldc-enable' "$LDC"
			if test "$REBOOT" = "True"
				vtb -Q -a $argv[1] -d $argv[3] reboot
			end
		else
			echo "Please provide \"-d\" if attempting to pass a device ID."
		end
	else
		echo "Please provide a token, serial/device ID, and toggle (y/n)"
	end
end

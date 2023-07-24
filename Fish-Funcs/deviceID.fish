function deviceID --description 'Pulls the device ID from the serial number that is given' -a SERIAL
	echo "O       o O       o O       o
| O   o | | O   o | | O   o |
| | O | | | | O | | | | O | |
| o   O | | o   O | | o   O |
o       O o       O o       O"
	if test (count $argv) -lt 1
		set id $(vtoolbox device.lookup -s $serial | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
	else
		set id $(vtoolbox device.lookup -s $argv[1] | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
	end
	echo "Camera ID: $id"
end

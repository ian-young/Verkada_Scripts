function deviceID --description 'Pulls the device ID from the serial number that is given' -a SERIAL
	if test "$argv[1]" = "-l"
		set id \
		$(vtb -Q -s $serial device-lookup| grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
		echo "$id"
	else if test "$argv[1]" = "-h"
		echo "Run with no arguments to use $serial as the camera serial number."
		echo "Otherwise, run with -l to make it compatible for easy copy and paste into an array or -s to specify the serial number that will be used."
	else if test "$argv[1]" = " -s"
		echo "O       o O       o O       o
| O   o | | O   o | | O   o |
| | O | | | | O | | | | O | |
| o   O | | o   O | | o   O |
o       O o       O o       O"
		set id \
		$(vtb -Q -s $argv[2] device-lookup | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
		echo "Camera ID: $id"
	else
		echo "O       o O       o O       o
| O   o | | O   o | | O   o |
| | O | | | | O | | | | O | |
| o   O | | o   O | | o   O |
o       O o       O o       O"
	set id $(vtb -Q -s $serial device-lookup | grep "cameraId" | tr -d ',"' | awk -F ' ' '{print $2}')
	echo "Camera id: $id"
	end
end

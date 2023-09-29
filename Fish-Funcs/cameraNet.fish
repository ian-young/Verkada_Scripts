function cameraNet --description 'Prints the camera needed to view camera network settings' -a AUTH_CODE SERIAL
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
	   ________________     ,9`      /   / |
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
----------------------------------------------------"
 	
	if test "$argv[1]" = "--help"
		# Help text
		echo "For 1"
		echo "This command my be ran stand alone or with the arguments for the support token and camera serial number."
		echo "vtoolbox remotesh.ifconfig -a $(set_color cyan)<auth_code>$(set_color normal) -s $(set_color cyan)<camera_serial>$(set_color normal)"
		echo "---------------------------------------------------"
	else if test (count $argv) -lt 3
		# If there are less than two arguments provided
		echo "Running for camera: $serial"
		echo "---------------------------------------------------" 
		set RESULTS $(vtb -Q -a $auth -s $serial ifconfig | grep -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
	else if test (count $argv) -lt 4
		# If two arguments are provided
		echo "Running for $argv[3]"
		echo "---------------------------------------------------" 
		set RESULTS $(vtb -Q -a $argv[1] -d $argv[3] ifconfig | grep -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
	end
	echo "$RESULTS"
end

function forceSync --description 'Forces the camera to sync with its NTP server.' -a AUTH SERIAL
	  echo "        ______                ___    __                       
       /\__  _\              /\_ \  /\ \                      
 __  __\/_/\ \/   ___     __\//\ \ \ \ \____    ___   __  _  
/\ \/\ \  \ \ \  / __`\  / __`\\ \ \ \ \ '__`\  / __`\/\ \/'\ 
\ \ \_/ |  \ \ \/\ \L\ \/\ \L\ \\_\ \_\ \ \L\ \/\ \L\ \/>  </ 
 \ \___/    \ \_\ \____/\ \____//\____\\ \_,__/\ \____//\_/\_\\
  \/__/      \/_/\/___/  \/___/ \/____/ \/___/ \/___/ \//\/_/"
	set CURRENT $(pwd)
	cd ~/Documents/.scripts
	if test "$argv[1]" = "--help"
		# Print help textT
		echo "Takes no input or a support token and serial number"
		echo "Will force the camera to sync with the NTP servers."
	else if test (count $argv) -lt 2
		# The variables are not given as arguemnts
		bash forceSync.sh -a $auth -s $serial
	else if test (count $argv) -lt 3
		# Two variables given
		bash forceSync.sh -a $argv[1] -s $argv[2]
	else if test (count $argv) -lt 4
		# Three variables given
		bash forceSynch.sh -a $argv[1] -d $argv[3]
	else
		echo "Takes no input or a support token, serial number, or \"-d\" with a device ID."
		echo "Please check spacing and try again."
	end
	cd $CURRENT
end

function listNTP --description 'Lists the NTP server(s) that the camera is connected to.' -a AUTH SERIAL
	  echo "        ______                ___    __                       
       /\__  _\              /\_ \  /\ \                      
 __  __\/_/\ \/   ___     __\//\ \ \ \ \____    ___   __  _  
/\ \/\ \  \ \ \  / __`\  / __`\\ \ \ \ \ '__`\  / __`\/\ \/'\ 
\ \ \_/ |  \ \ \/\ \L\ \/\ \L\ \\_\ \_\ \ \L\ \/\ \L\ \/>  </ 
 \ \___/    \ \_\ \____/\ \____//\____\\ \_,__/\ \____//\_/\_\\
  \/__/      \/_/\/___/  \/___/ \/____/ \/___/ \/___/ \//\/_/

 "
	set current $(pwd)
	cd ~/Documents/.scripts
	if test "$argv[1]" = "--help"
		# Print help text
		echo "This command may run with no arguments or with a support token and serial number."
		echo "This command will print a list of all NTP servers that a camera is connected to."
	else if test (count $argv) -lt 2
		# If there are less than two arguments
		bash listNTP.sh -a $auth -s $serial
	else if test (count $argv) -lt 3
		# If there are two arguments
		bash listNTP.sh -a $argv[1] -s $argv[2]
	else if test (count $argv) -lt 4
		# Three arguments
		bash listNTP.sh -a $argv[1] -d $argv[3]
	else
		echo "This command may run with no arguments or with a support token and serial number."
		echo "This command will print a list of all NTP servers that a camera is connected to."
	end
	cd $current
end

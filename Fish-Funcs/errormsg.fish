function errormsg --description 'Prints the camera\'s error messages.' -a AUTH SERIAL
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
		# Help text
		echo "Prints \"recent\" error messages on a camera."
		echo "Expects either no input or a givent support token and serial number"
	else if test (count $argv) -lt 2
		# If there are less than two arguments, pull from environment
		bash errormsg.sh -a $auth -s $serial
	else
		bash errormsg.sh -a $argv[1] -s $argv[2]
	else if test (count $argv) -lt 4
		# If two arguments are provided
		echo "Running for $argv[3]"
		echo "---------------------------------------------------"
		bash errormsg.sh -a $argv[1] -d $argv[3]	
	end
	cd $CURRENT
end

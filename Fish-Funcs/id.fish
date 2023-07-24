function id --description 'Prints the org ID associated with a support token' -a AUTH

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
		# Print help text
		echo "Prints the org ID that is associated to a support token"
	else if test (count $argv) -lt 1
		bash id.sh -a $auth
	else
		bash id.sh -a $argv[1]
	end
	cd $CURRENT
	set -e CURRENT 
        
end

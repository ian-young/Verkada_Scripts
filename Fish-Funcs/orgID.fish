function orgID  --description 'alias orgID=set current pwd;scripts;bash orgID.sh -a FU3GJ2DZS6PUS;cd ;set -e current'
  echo "        ______                ___    __                       
       /\__  _\              /\_ \  /\ \                      
 __  __\/_/\ \/   ___     __\//\ \ \ \ \____    ___   __  _  
/\ \/\ \  \ \ \  / __`\  / __`\\ \ \ \ \ '__`\  / __`\/\ \/'\ 
\ \ \_/ |  \ \ \/\ \L\ \/\ \L\ \\_\ \_\ \ \L\ \/\ \L\ \/>  </ 
 \ \___/    \ \_\ \____/\ \____//\____\\ \_,__/\ \____//\_/\_\\
  \/__/      \/_/\/___/  \/___/ \/____/ \/___/ \/___/ \//\/_/
 "
 echo "----------------------------"
 set current $(pwd);cd ~/Documents/.scripts;bash orgID.sh -a $auth;cd ;set -e current $argv
        
end

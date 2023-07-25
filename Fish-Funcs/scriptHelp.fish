#! /usr/bin/env bash
# Author: Ian Young
# Prints out help for what functions are currently available along with their uses

function scriptHelp --description 'prints available scipts along with their functions'
	clear
	echo "$(set_color red)                 
 ( /(       (         
 )\())   (  )\        
((_)\   ))\((_)`  )   
 _((_) /((_)_  /(/(   
| || |(_)) | |((_)_\  
| __ |/ -_)| || '_ \) 
|_||_|\___||_|| .__/ 
              |_|     
$(set_color normal)"
	echo "$(set_color blue)Any of the vToolbox commands can take input."
	echo "Or, you can be lazy and define the support token in \$auth, orgID in \$org, and camera serial in \$serial and run with no arguments."
	echo "Most of these commands may be ran using the argument '--help' to print a help message specifically for it. $(set_color normal)"
	echo "$(set_color green)---------------------------------------------$(set_color normal)"
	echo "$(set_color yellow)allSer:$(set_color normal)			Prints all camera serial numbers given an orgID. Can take the orgID as input."
	echo "$(set_color yellow)bye:$(set_color normal)			Closes the terminal and clears history."
	echo "$(set_color yellow)cameraNet:$(set_color normal)		May be ran: as is, with --help, or with a token and serial. Outputs the associated IPs with the camera."
	echo "$(set_color yellow)clean:$(set_color normal)			Cleans the terminal and prints some ASCII art."
	echo "$(set_color yellow)deviceID:$(set_color normal)		Returns a device's ID given a serial number."
	echo "$(set_color yellow)e:$(set_color normal)			Opens the nvim text editor."
	echo "$(set_color yellow)exe:$(set_color normal)			Will run chmod 777 against the input."
	echo "$(set_color yellow)endpoints:$(set_color normal)		Takes the support token and camera serial and will check endpoint health."
	echo "$(set_color yellow)errormsg:$(set_color normal)		Takes the support token and camera serial and will show camera error messages."
	echo "$(set_color yellow)fishing:$(set_color normal)		Takes you to the functions page for fish."
	echo "$(set_color yellow)forceSync:$(set_color normal)		Takes the support token and camera serial and will force an NTP sync on the camera."
	echo "$(set_color yellow)home:$(set_color normal)       		Takes you home."
	echo "$(set_color yellow)id:$(set_color normal)         		Will take the variable \$auth and print the userID, orgID, and user email."
	echo "$(set_color yellow)ldc:$(set_color normal)			Toggles LDC on a camera. Takes either y/n or token s/n y/n or token \"-d\" deviceID y\n"
	echo "$(set_color yellow)listNTP:$(set_color normal)		Lists all the NTP servers that a cmaera is synced to."
	echo "$(set_color yellow)new:$(set_color normal)			Starts a new terminal."
	echo "$(set_color yellow)newScript:$(set_color normal)		Injects the basic code to a given file that is needed to start a new bash script."
	echo "$(set_color yellow)orgID:$(set_color normal)      		Will take the variable \$auth and print the orgID."
	echo "$(set_color red)out:$(set_color normal)			Test script for rotating colors no output." 
	echo "$(set_color yellow)scriptHelp:$(set_color normal) 		Prints this help message listing out what all the scripts do."
	echo "$(set_color yellow)scripts:$(set_color normal)    		Will take you to where all the scripts reside on the system."
	echo "$(set_color yellow)startup:$(set_color normal)		Opens and new terminal and moves the originally terminal's cwd to scripting."
	echo "$(set_color yellow)tips:$(set_color normal)			Displays tips for running all of these commands."
	echo "$(set_color yellow)update:$(set_color normal)			Updates vToolbox and brew applications." 
	echo "$(set_color green)---------------------------------------------$(set_color normal)"
end

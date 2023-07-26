function master --description 'The goal of this program is to allow the user to run all other fish functions from here' -a HELP
	if count $argv > /dev/null
		# Ran if any number of arguments is given
		echo "This program allows the user to run all fish functions easily. $(set_color red)It is to be ran without arguments.$(set_color normal)"
		echo "A list of commands will be printed and a number is expected to be given to run the respective command."
		exit 1
	end

	set leave true
	while $leave
		echo "-------------------------------------------"
		echo \
"1.  allSer
2.  bye
3.  cameraNet
4.  clean
5.  deviceID
6.  endpoints
7.  errormsg
8.  forceSync
9.  id
10. ldc
11. listNTP
12. new
13. orgID
14. scriptHelp
15. startup
16. tips
17. update
18. Set variables

To leave, enter \"e\""

		read -l -P "Choice: " input
		
		set input (string trim "$input") # Trim the input
		switch $input
			case '1'
				allSer
			case '2'
				bye
			case '3'
				cameraNet
			case '4'
				clean
			case '5'
				deviceID
			case '6'
				endpoints
			case '7'
				errormsg
			case '8'
				forceSync
			case '9'
				id
			case '10'
				read -l -P "Toggle on (y) or off (y)? " toggle
				ldc $toggle
			case '11'
				listNTP
			case '12'
				new
			case '13'
				orgID
			case '14'
				scriptHelp
			case '15'
				startup
			case '16'
				tips
			case '17'
				update
			case '18'
				while $leave
					echo "-------------------------------------------"
					echo \
					"
a. auth
o. org
d. device ID
s. serial

To leave, enter \"e\""

					read -l -P " Which variable would you like to set? " input
					
					set input $(string trim $input)

					switch $input
						case 'a'
							read -l -P "Set auth to: " input
							
							set input $(string trim $input)

							set auth $input

							echo "Auth variable set to: $auth"
						case 'o'
							read -l -P "Set org ID to: " input
							
							set input $(string trim $input)

							set org $input

							echo "Org variable set to: $org"
						case 'd'
							read -l -P "Set device ID to: " input
							
							set input $(string trim $input)

							set device $input

							echo "Device variable set to: $device"
						case 's'
							read -l -P "Set serial to: " input
							
							set input $(string trim $input)

							set serial $input

							echo "Serial variable set to: $auth"
						case 'e'
							set leave false
						case '*'
							echo "$(set_color red)Please enter one of the options$(set_color normal)"
					end
				end
					set leave true
			case 'e'
				set leave false
			case '*'
				# Defualt case
				echo "$(set_color red)Please enter one of the valid options listed above or e to exit.$(set_color normal)"
		end
	end
end

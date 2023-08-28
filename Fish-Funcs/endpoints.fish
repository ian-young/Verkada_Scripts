#!//usr/bin/env fish
function endpoints --description 'Lists all endpoints a camera can (or cannot) connect to.' -a AUTH PARAM SERIAL
	set CURRENT $(pwd)
	cd ~/Documents/.scripts
	if test "$argv[1]" = "--help"
		# Help text
		echo "This command will test all the endpoints the camera's should be connected to."
		echo "This will test only one camera, so if you'd like to test multiple, create a for loop."
	end

	echo "Running with $argv[1] $argv[2] $argv[3]"
	if test (count $argv) -lt 2
		bash endpoints.sh -a $auth -s $serial
	end
	if test (count $argv) -lt 3
		echo "Running for: $serial"
		bash endpoints.sh -a $auth -s $serial
	else
		if test "$argv[2]" = "-d"
			echo "Running for: $argv[3]"
			bash endpoints.sh -a $argv[1] -d $argv[3]
		else
			echo "Running for: $argv[3]"
			bash endpoints.sh -a $argv[1] -s $argv[3]
		end
	end
	cd "$CURRENT"
end

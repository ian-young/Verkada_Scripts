function allSer --description 'Returns all serial numbers for cameras in a given organization' -a AUTH ORG_ID
	echo ""
	echo "      o8Oo./
   ._o8o8o8Oo_.
    \========/
     `------'"
     echo ""
	
     if test "$argv[1]" = "--help"
	     # Help text
	     echo "This command takes the locally defined variable \"\$org\" or the org ID as input."
	else if test (count $argv) -lt 2
		# If there is less than one aragument provided
     		vtoolbox organizations.get-all-camera-info -a $auth -o $org| grep "serial" | awk -F ' ' '{print $2}' |tr -d '",'
	else
		# If the argument is provided
		vtoolbox oganizations.get-all-camera-info -a $argv[1] -o $argv[2] | grep "serial" \
		| awk -F ' ' '{print $2}' | tr -d '",'
	end
end

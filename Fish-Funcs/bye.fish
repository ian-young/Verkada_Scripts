function bye --description 'clears history and closes out the shell'
	disown $(jobs -p)
	clear
	echo "| Closing session"
	sleep .15
	clear
	echo "/ clOsing session."
	sleep .15
	clear
	echo "- closinG session.."
	sleep .15
	clear
	echo "\ closing seSsion..."
	sleep .15
	clear
	echo "| closing sessioN..."
	sleep .15
	builtin history clear
	exit
end

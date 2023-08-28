function startup --description 'Runs the basic startup commands to begin your terminal experience!'
	clear
	brew update &;brew upgrade &;pip3 install --upgrade verkada-vtoolbox &;python3 -m pip install --upgrade pip &
	echo "$(set_color blue)⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣦⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⡿⠿⠛⠋⢉⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⣈⡉⠙⠛⠿⢿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⠟⠋⢁⣠⣴⣶⣿⣿⣿⣿⠛⠉⠉⠉⠉⠉⠉⠛⣿⣿⣿⣿⣶⣦⣄⡈⠙⠻⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⠟⠋⣀⣴⣾⠿⠛⠉⢹⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡏⠉⠛⢿⣷⣦⡀⠙⠿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⠟⢁⣠⣾⡿⠋⠁⠀⠀⠀⠘⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠁⠀⠀⠀⠈⠙⢿⣷⣄⠈⠻⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣴⣿⣿⣿⠟⠁⣰⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠉⠻⣷⣄⠈⢻⣿⣿⣿⣦⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣾⣿⣿⣿⠋⢠⣾⣿⣁⣀⣀⣀⣀⣀⣀⣀⣀⣀⣸⣿⣿⣿⣇⣀⣀⣀⣀⣀⣀⣾⣿⣿⣿⣇⣀⣀⣀⣀⣀⣀⣀⣀⣀⣘⣿⣷⡀⠙⣿⣿⣿⣷⡀⠀⠀⠀
⠀⠀⢀⣾⣿⣿⡿⠁⣰⣿⣿⣿⣿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠻⣿⣿⣿⣿⣄⠘⢿⣿⣿⣷⡀⠀⠀
⠀⠀⣾⣿⣿⡿⠁⣰⣿⣿⣿⣿⣿⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣿⣿⣿⣿⣿⣆⠘⣿⣿⣿⣧⠀⠀
⠀⣸⣿⣿⣿⠃⢰⣿⣿⣿⡋⠉⠙⠻⢿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⡿⠟⠉⠉⢹⣿⣿⣿⡄⠘⣿⣿⣿⣇⠀
⢀⣿⣿⣿⡏⢀⣿⡏⠀⠹⣷⡀⠀⠀⠀⠉⠛⠿⣷⣦⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣠⣴⣾⠿⠛⠁⠀⠀⠀⢀⣾⠏⠀⢻⣷⠀⢻⣿⣿⣿⡀
⢸⣿⣿⣿⠁⢸⣿⠁⠀⠀⠙⣷⡄⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⢠⣿⠃⠀⠀⠈⣿⡇⠈⣿⣿⣿⡇
⣿⣿⣿⣿⠀⣿⡟⠀⠀⠀⠀⠘⢿⡄⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⠛⠙⢿⣿⣿⣿⣿⡿⠋⠻⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⣠⡿⠃⠀⠀⠀⠀⣿⣷⠀⣿⣿⣿⣧
⣿⣿⣿⡇⠀⣿⡇⠀⠀⠀⠀⠀⠈⢿⣆⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⣤⡀⠀⠀⠀⠀⢀⣤⣴⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⣰⡿⠁⠀⠀⠀⠀⠀⢸⣿⠀⢿⣿⣿⣿
⣿⣿⣿⡇⠀⣿⡇⠀⠀⠀⠀⣀⣤⣼⣿⣆⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣷⡀⠀⠀⢠⣾⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⣼⣿⣦⣄⣀⠀⠀⠀⠀⢸⣿⠀⣿⣿⣿⣿
⢿⣿⣿⣿⠀⣿⣧⣤⣶⣾⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⡄⢠⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣷⣶⣤⣿⡿⠀⣿⣿⣿⡟
⢸⣿⣿⣿⡀⢸⣿⣿⣿⣿⣿⣿⠿⠛⠋⠀⠹⣧⡀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣄⣠⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⢀⣾⠏⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⡇⢠⣿⣿⣿⡇
⠈⣿⣿⣿⣇⠈⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠹⣷⡀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⢠⣾⠋⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⡿⠀⣼⣿⣿⣿⠀
⠀⢹⣿⣿⣿⡄⠸⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡄⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠃⢰⣿⣿⣿⠇⠀
⠀⠀⢿⣿⣿⣷⡀⠹⣿⣄⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣄⠀⠀⠀⠀⠀⠀⠈⣿⣿⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⣰⣿⠏⢠⣿⣿⣿⡟⠀⠀
⠀⠀⠈⢿⣿⣿⣷⡄⠹⣿⣦⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⢿⣆⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⣴⡿⣿⣿⣿⣿⣿⣶⣄⡀⠀⠀⣴⣿⠃⢠⣿⣿⣿⡟⠁⠀⠀
⠀⠀⠀⠈⢿⣿⣿⣿⣄⠈⢿⣷⣶⣿⣿⣿⣿⣿⡿⠛⠁⠀⢻⣦⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⣼⡟⠀⠈⠻⢿⣿⣿⣿⣿⣿⣶⣾⡟⠁⣰⣿⣿⣿⡟⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠻⣿⣿⣿⣧⡀⠙⢿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠻⣧⠀⠀⠀⠀⣿⣿⠀⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⡿⠋⢀⣾⣿⣿⣿⠏⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣦⡀⠙⢿⣿⣤⡀⠀⠀⠀⠀⠀⠀⠹⣷⡀⠀⠀⣿⣿⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠀⢀⣤⣿⠿⠋⣀⣴⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣷⣄⡈⠛⢿⣷⣦⣄⡀⠀⠀⠀⠙⣷⣦⣶⣿⣿⣶⣴⣿⠃⠀⠀⠀⢀⣠⣴⣾⠿⠛⢁⣠⣾⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣶⣤⣈⠙⠛⠿⢿⣶⣶⣤⣾⣿⣿⣿⣿⣿⣿⣧⣤⣶⣶⡿⠿⠛⠋⣀⣤⣶⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣦⣤⣀⣉⠉⠙⠛⠛⠛⠛⠛⠛⠉⠉⣉⣀⣤⣴⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠿⠿⠿⢿⣿⣿⣿⣿⡿⠿⠿⠿⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"

	echo "$(set_color red)⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  Welcome, Mr. Young$(set_color normal)"
	echo ""
	alacritty &
	cd /Users/ian.young/.config/fish/functions
end

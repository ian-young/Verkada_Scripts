#!/usr/bin/env bash
# Author: Ian Young

function brewInstall () {
	# install Homebrew the macOS package manager
	 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	
	# install xcode command line tools (needed for homebrew)
	 xcode-select --install
}


function brewDownload () {
	# Runs the installs that I have in brew
	brew install fish htop git neofetch neovim cloudflare/cloudflare/cloudflared pyenv
	echo "-----------------------------------"
	echo "               O  o"
        echo "          _\_   o"
	echo "       \\\\/  o\ ."
	echo "       //\___="
	echo "          ''"
	if grep -Fxq "/opt/homebrew/bin/fish" "/etc/shells"; then
		echo "Fish aleardy in known shells"
	else
		echo "Introducing fish to your diet."
		echo "/opt/homebrew/bin/fish" | sudo tee -a "/etc/shells" > /dev/null
	fi
	chsh -s /opt/homebrew/bin/fish
	cat > ~/.config/fish/config.fish << \
EOF
if status is-interactive
     neofetch
    echo "\$(set_color blue)Just a reminder, when running scripts, set the auth token to the variable \"auth\" for the scripts to work."
    echo "They do not require any input"
    echo "If you ever get lost, simply type the command \"scriptHelp\" for more information on what is available."
    echo "The variables \"auth\" and \"serial\" are highly recommended to make things easier on yourself.\$(set_color normal)"
end
EOF

}


function vToolboxSetup () {
	# Runs the necessary code to install vtb for the most part...
	# Certain aspects of this code cannot be automated due to needing to allow vtb to run in Privacy & Security.

	# Download the vtb file
	curl -L -o vtb https://vtoolbox.staging.cf.verkada.com/vtoolbox_releases/darwin/vtb
	
	mkdir $HOME/.vtb
	mv vtb $HOME/.vtb/vtb.darwin
	chmod +x $HOME/.vtb/vtb.darwin
	sudo ln -s $HOME/.vtb/vtb.darwin /usr/local/bin/vtb

	echo "If the command vtb doesn't run from anywhere in the terminal, run the following command:"
	echo "sudo ln -s $HOME/.vtb/vtb.darwin /usr/local/bin/vtb"
	echo "vtb set up has been completed!"
}


brew=""
vToolbox=""

# Set to accept one argument and check it
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "Gets you all caught up to use Ian's scripts."
	exit 0
fi


until [ "$brew" == "y" ] || [ "$brew" == "n" ]; do

	read -p "Is brew already installed? (y/n) " brew

	brew=$(echo "$brew" | tr '[:upper:]' '[:lower:]')

	if [ "$brew" != "y" ] && [ "$brew" != "n" ]; then
		echo "Please enter y/n"
	fi
done

echo "-----------------------------------" # Make it clear that the next prompt (if applicabple) is new.

if [ "$brew" == "y" ]; then
	until [ "$vToolbox" == "y" ] || [ "$vToolbox" == "n" ]; do

		read -p "Is vtb already installed? (y/n) " vToolbox

		vToolbox=$(echo "$vToolbox" | tr '[:upper:]' '[:lower:]')

		if [ "$vToolbox" != "y" ] && [ "$vToolbox" != "n" ]; then
			echo "Please enter y/n"
		fi
	done
else
	vToolbox="n" # vToolbox needs brew to be installed
fi
echo ""
echo "                               \\\\\\\\\\\\\\"
echo "     WAITING...             \\\\\\\\\\\\\\\\\\\\\\\\"
echo "                          \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
echo "  -----------,-|           |C>   // )\\\\\\\\|"
echo "           ,','|          /    || ,'/////|"
echo "---------,','  |         (,    ||   /////"
echo "         ||    |          \\\\  ||||//''''|"
echo "         ||    |           |||||||     _|"
echo "         ||    |______      \`\`\`\`\`\\____/ \\"
echo "         ||    |     ,|         _/_____/ \\"
echo "         ||  ,'    ,' |        /          |"
echo "         ||,'    ,'   |       |         \\  |"
echo "_________|/    ,'     |      /           | |"
echo "_____________,'      ,',_____|      |    | |"
echo "             |     ,','      |      |    | |"
echo "             |   ,','    ____|_____/    /  |"
echo "             | ,','  __/ |             /   |"
echo "_____________|','   ///_/-------------/   |"
echo "               |===========,'"
echo "-----------------------------------"

if [ "$brew" == "n" ]; then
	brewInstall
	brewDownload
	if [ "$vToolbox" == "n" ]; then
		vToolboxSetup
	fi
else
	if [ "$vToolbox" == "y" ]; then
		brewDownload
	else
		brewDownload
		vToolboxSetup	
	fi
fi




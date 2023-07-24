function update --description 'Updates all applications installed via terminal'
	brew update;brew upgrade;pip3 install --upgrade verkada-vtoolbox;python3 -m pip install --upgrade pip
end

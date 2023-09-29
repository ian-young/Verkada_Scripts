function update --description 'Updates all applications installed via terminal'
	brew update
	brew upgrade
	brew cleanup
	python3 -m pip install --upgrade pip >> /dev/null
	vtb -U
end

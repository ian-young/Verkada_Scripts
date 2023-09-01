function update --description 'Updates all applications installed via terminal'
	brew update
	brew upgrade
	pip3 install --upgrade verkada-vtoolbox >> /dev/null
	python3 -m pip install --upgrade pip >> /dev/null
end

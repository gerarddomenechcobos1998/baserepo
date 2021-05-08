#!/bin/bash
echo "Chose your installation option (Update System first):"
options=("Update System" "Install Docker" "Install Docker-compose" "Install NodeJS" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Update System")
			sudo apt-get install build-essential
			sudo apt-get install net-tools
			sudo apt-get update -y
			sudo apt-get upgrade -y
			;;
		"Install Docker")
			curl -fsSL https://get.docker.com -o get-docker.sh
			sudo bash get-docker.sh
			sudo usermod -aG docker $(whoami)
			docker -v
			sudo reboot
			;;
		"Install Docker-compose")
			sudo apt install python3-pip -y
			sudo pip3 install docker-compose
			docker-compose version
			;;
		"Install NodeJS")
			curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
			sudo apt install nodejs
			node -v
			npm -v
			;;
		"Quit")
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done

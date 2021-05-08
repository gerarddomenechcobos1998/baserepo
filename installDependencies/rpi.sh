#!/bin/bash
# Execute this command with permisions: chmod 777
echo "Chose your installation option (Update System first):"
options=("Update System" "Install Docker" "Install Docker-compose" "Install NodeJS" "Install V4l2" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Update System")
			sudo apt-get install build-essential
			sudo apt-get install net-tools
			sudo apt-get update -y
			sudo apt-get upgrade -y
			sudo rpi-update
			;;
		"Install Docker")
			cd /home/pi
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
		"Install V4l2")
			echo "Before continuing you should Update System Step!"
			#git clone https://github.com/RPI-Distro/rpi-source
			git clone https://github.com/umlaeute/v4l2loopback.git
			sudo apt install git bc bison flex libssl-dev -y
			sudo wget https://raw.githubusercontent.com/RPi-Distro/rpi-source/master/rpi-source -O /usr/local/bin/rpi-source && sudo chmod +x /usr/local/bin/rpi-source && /usr/local/bin/rpi-source -q --tag-update
			#cd rpi-source
			rpi-source
			sudo apt install libncurses5-dev -y
			cd v4l2loopback
			make && sudo make install
			echo "For adding more than one /dev/video you should change the video_nr variable and assign a number that will have the /dev/video'X' camera device"
			sudo insmod /lib/modules/5.10.25-v7l+/extra/v4l2loopback.ko video_nr=100
			echo "Your v4l2 cam has been attached to /dev/video100 file"
			echo "If the user wants to modify the /dev/video'X' modify the value asociated to video_nr of this script"
			;;
		"Quit")
			break
			;;
		*) echo "invalid option $REPLY";;
	esac
done
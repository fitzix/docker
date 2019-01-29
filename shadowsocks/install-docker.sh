#!/usr/bin/env bash

# Color

install_docker() {
	apt remove docker docker-engine docker.io containerd runc

	apt update

	apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	apt fingerprint 0EBFCD88

	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

	apt update

	apt install -y docker-ce
}

install_docker_compose() {
	wget -O "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
}

check_docker() {
	if [ -x "$(command -v docker)" ]; then
		echo "docker is installed"
		# command
	else
		echo "Install docker"
		# command
		install_docker
	fi
}

check_docker_compose() {
	if [ -x "$(command -v docker-compose)" ]; then
		echo "docker-compose is installed"
		# command
	else
		echo "Install docker-compose"
		# command
		install_docker_compose
	fi
}

# check docker
check_docker
check_docker_compose

echo "download compose file from fitzix github"
wget "https://raw.githubusercontent.com/fitzix/docker/master/shadowsocks/docker-compose.yml" -O docker-compose.yml

read -p '是否安装webgui? (y/n) ' is_install_webgui

if [[ $is_install_webgui == 'y' ]]; then
	docker-compose stop ss-webgui
	docker-compose pull
	docker-composer up -d --force-recreate ss-webgui
else
	docker-compose stop ss-mgr
	docker-compose pull
	docker-compose up -d --force-recreate ss-mgr
fi
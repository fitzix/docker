#!/bin/bash

# Color

install_docker() {
	curl -fsSL https://get.docker.com -o get-docker.sh
	bash get-docker.sh
}

install_docker_compose() {
	curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
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
curl -sO 'https://raw.githubusercontent.com/fitzix/docker/master/shadowsocks/docker-compose.yml'

read -p '是否安装webgui? (y/n) ' is_install_webgui

if [ $is_install_webgui == 'y' ]; then
	docker-compose down
	docker-compose pull
	docker-composer up -d --force-recreate ss-webgui
else
	docker-compose down
	docker-compose pull
	docker-compose up -d --force-recreate ss-mgr
fi
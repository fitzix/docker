#!/usr/bin/sh

# wget -qO- https://raw.githubusercontent.com/fitzix/docker/master/shadowsocks/install-docker.sh | sh
# wget -O /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/1.23.2/docker-compose-Linux-x86_64 && chmod +x /usr/local/bin/docker-compose

apt remove docker docker-engine docker.io containerd runc

apt update

apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt fingerprint 0EBFCD88

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update

apt install -y docker-ce
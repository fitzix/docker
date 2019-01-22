#!/bin/sh

echo -e "\033[32mStarting ssmgr slave...\033[0m"

npm i -g shadowsocks-manager --unsafe-perm

ssmgr -c /shadowsocks/ss.yml
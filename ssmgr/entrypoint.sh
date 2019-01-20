#!/bin/sh

SS_MANAGER_WEBGUI=${SS_MANAGER_WEBGUI-0}

echo -e "\033[32mStarting shadowsocks...\033[0m"

ss-manager -m aes-256-cfb -u --manager-address 127.0.0.1:6887 &

sleep 1

echo -e "\033[32mStarting ssmgr slave...\033[0m"

if [ $SS_MANAGER_WEBGUI == 1 ]
then
    # xssmgr 0.3.0 need edis
    redis-server --daemonize yes && ssmgr -c /shadowsocks/ss-web.yml &
    sleep 2
fi

ssmgr -c /shadowsocks/ss.yml
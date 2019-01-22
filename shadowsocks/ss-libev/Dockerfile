FROM shadowsocks/shadowsocks-libev

EXPOSE 6887/udp

USER root

CMD [ "ss-manager", "-m", "aes-256-cfb", "-u", "--manager-address", "127.0.0.1:6887" ]
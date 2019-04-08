FROM shadowsocks/shadowsocks-libev

ENV TZ 'Asia/Shanghai'

RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apk del tzdata

EXPOSE 6887/udp

USER root

CMD [ "ss-manager", "-m", "aes-256-cfb", "-u", "--manager-address", "127.0.0.1:6887" ]
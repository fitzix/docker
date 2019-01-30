FROM node:8-alpine

LABEL maintainer="fitzix <caojunkaiv@gmail.com>"

ENV TZ 'Asia/Shanghai'

RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apk del tzdata

EXPOSE 6889

WORKDIR /shadowsocks

COPY ss-web.yml entrypoint.sh ./

ENTRYPOINT [ "/shadowsocks/entrypoint.sh" ]
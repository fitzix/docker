FROM node:8-alpine

LABEL maintainer="fitzix <caojunkaiv@gmail.com>"

EXPOSE 6889

WORKDIR /shadowsocks

COPY ss-web.yml entrypoint.sh ./

ENTRYPOINT [ "/shadowsocks/entrypoint.sh" ]
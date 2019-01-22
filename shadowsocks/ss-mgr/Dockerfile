FROM node:8-alpine

LABEL maintainer="fitzix <caojunkaiv@gmail.com>"

EXPOSE 6888

WORKDIR /shadowsocks

COPY ss.yml entrypoint.sh ./

ENTRYPOINT [ "/shadowsocks/entrypoint.sh" ]
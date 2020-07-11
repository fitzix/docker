FROM node:12-alpine
ARG V=1.9.2
WORKDIR /yapi
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait
RUN apk add --no-cache --virtual .gyp python make g++ \
    && mkdir vendors \
    && wget -c https://github.com/YMFE/yapi/archive/v${V}.tar.gz -O - | tar -xvz -C vendors --strip-components 1 \
    && cd vendors \
    && rm -rf vendors/docs \
    && npm install --production \
    && apk del .gyp
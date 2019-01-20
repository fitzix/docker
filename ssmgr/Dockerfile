FROM node:8-alpine

LABEL maintainer="fitzix <caojunkaiv@gmail.com>"
ENV SS_LIBEV_VERSION 3.2.3
EXPOSE 6888 6889


RUN set -ex \
    # ssmgr 0.3 need redis
    && apk add --no-cache redis \
    # Build environment setup
    && apk add --no-cache --virtual .build-deps-sslibev \
    autoconf \
    automake \
    build-base \
    c-ares-dev \
    libev-dev \
    libtool \
    libsodium-dev \
    linux-headers \
    mbedtls-dev \
    pcre-dev \
    curl \
    # Build & install
    && npm --registry=https://registry.npm.taobao.org i -g shadowsocks-manager --unsafe-perm \
    && curl -fsSLO https://github.com/shadowsocks/shadowsocks-libev/releases/download/v$SS_LIBEV_VERSION/shadowsocks-libev-$SS_LIBEV_VERSION.tar.gz \
    && tar -zxf shadowsocks-libev-$SS_LIBEV_VERSION.tar.gz \
    && cd shadowsocks-libev-$SS_LIBEV_VERSION \
    && ./configure --prefix=/usr --disable-documentation \
    && make install \
    && apk del .build-deps-sslibev \
    # Runtime dependencies setup
    && apk add --no-cache \
        rng-tools \
        $(scanelf --needed --nobanner /usr/bin/ss-* \
        | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
        | sort -u) \
    && rm -rf shadowsocks-libev-$SS_LIBEV_VERSION.tar.gz shadowsocks-libev-$SS_LIBEV_VERSION

WORKDIR /shadowsocks

COPY ss-web.yml ss.yml entrypoint.sh ./

ENTRYPOINT [ "/shadowsocks/entrypoint.sh" ]
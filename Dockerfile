# 基于 rooqs/php74-alpine 镜像，补全客户所需的 PHP 扩展
ARG BASE=rooqs/php74-alpine:7.4.33-fpm-alpine3.16-cve2026-109618
FROM ${BASE}

RUN set -eux; \
    apk add --no-cache --virtual .ext-build-deps \
        $PHPIZE_DEPS \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        gettext-dev \
        imap-dev \
        krb5-dev \
        openssl-dev \
        libmcrypt-dev \
        postgresql-dev \
        libxml2-dev \
        libzip-dev \
    ; \
    docker-php-ext-configure gd --with-freetype --with-jpeg; \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install -j"$(nproc)" \
        bcmath \
        gd \
        gettext \
        imap \
        mysqli \
        pcntl \
        pdo_mysql \
        pdo_pgsql \
        shmop \
        soap \
        sockets \
        sysvsem \
        xmlrpc \
        zip \
    ; \
    pecl install mcrypt-1.0.4; \
    docker-php-ext-enable mcrypt opcache; \
    apk add --no-cache --virtual .ext-runtime-deps \
        freetype libjpeg-turbo libpng gettext libmcrypt \
        imap krb5-libs libpq libxml2 libzip; \
    apk del --no-network .ext-build-deps; \
    rm -rf /tmp/pear /tmp/* /var/cache/apk/*

RUN php -m | grep -Ei '^(bcmath|gd|gettext|imap|mcrypt|mysqli|Zend OPcache|pcntl|pdo_mysql|pdo_pgsql|shmop|soap|sockets|sysvsem|xmlrpc|zip)$' | wc -l | grep -qx 16

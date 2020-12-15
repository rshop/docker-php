ARG ALPINE_VERSION=3.11

FROM alpine:$ALPINE_VERSION

ARG ALPINE_VERSION

ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN set -ex \
    && echo "https://dl.bintray.com/php-alpine/v$ALPINE_VERSION/php-7.3" >> /etc/apk/repositories \
    && echo "@php https://dl.bintray.com/php-alpine/v$ALPINE_VERSION/php-7.3" >> /etc/apk/repositories \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        php7 \
        php7-apcu \
        php7-bcmath \
        php7-bz2 \
        php7-calendar \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-ftp \
        php7-gd \
        php7-iconv \
        php7-imap \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqli \
        php7-opcache \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_sqlite \
        php7-phar \
        php7-posix \
        php7-redis \
        php7-soap \
        php7-sockets \
        php7-sodium \
        php7-xml \
        php7-xmlreader \
        php7-zip \
        php7-zlib \
    && ln -sf /usr/bin/php7 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php7

ENV PHP_DISPLAY_ERRORS On
ENV PHP_MAX_EXECUTION_TIME -1
ENV PHP_MEMORY_LIMIT -1
ENV PHP_OPCACHE_REVALIDATE_FREQ 0
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS 0
ENV PHP_UPLOAD_MAX_FILESIZE 8M
ENV PHP_SESSION_SAVE_HANDLER files
ENV PHP_SESSION_SAVE_PATH /tmp
ENV PHP_SESSION_GC_MAXLIFETIME 1440

COPY conf.d/* /etc/php7/conf.d/

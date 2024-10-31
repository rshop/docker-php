FROM alpine:edge

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
ENV PHPIZE_DEPS="autoconf automake dpkg dpkg-dev file g++ gcc libc-dev libtool make pcre-dev pcre2-dev php84-dev php84-pear pkgconf re2c zlib-dev"

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        php84 \
        php84-pecl-apcu \
        php84-bcmath \
        php84-bz2 \
        php84-calendar \
        php84-ctype \
        php84-curl \
        php84-dom \
        php84-fileinfo \
        php84-ftp \
        php84-gd \
        php84-iconv \
        php84-intl \
        php84-mbstring \
        php84-mysqli \
        php84-opcache \
        php84-pdo \
        php84-pdo_mysql \
        php84-pdo_sqlite \
        php84-phar \
        php84-posix \
        php84-redis \
        php84-simplexml \
        php84-soap \
        php84-sockets \
        php84-sodium \
        php84-tokenizer \
        php84-xml \
        php84-xmlreader \
        php84-xmlwriter \
        php84-zip \
        php84-zlib \
    && ln -sf /usr/bin/php84 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php84

ENV PHP_DISPLAY_ERRORS On
ENV PHP_MAX_EXECUTION_TIME -1
ENV PHP_MEMORY_LIMIT -1
ENV PHP_OPCACHE_REVALIDATE_FREQ 0
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS 0
ENV PHP_UPLOAD_MAX_FILESIZE 8M
ENV PHP_SESSION_SAVE_HANDLER files
ENV PHP_SESSION_SAVE_PATH /tmp
ENV PHP_SESSION_GC_MAXLIFETIME 1440

COPY conf.d/* /etc/php84/conf.d/
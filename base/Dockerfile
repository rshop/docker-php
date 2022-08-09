FROM alpine:edge

ENV PHPIZE_DEPS="autoconf automake dpkg dpkg-dev file g++ gcc libc-dev libtool make pcre-dev pcre2-dev php81-dev php81-pear pkgconf re2c zlib-dev"

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        php81 \
        php81-bcmath \
        php81-bz2 \
        php81-calendar \
        php81-ctype \
        php81-curl \
        php81-dom \
        php81-fileinfo \
        php81-ftp \
        php81-gd \
        php81-iconv \
        php81-imap \
        php81-intl \
        php81-json \
        php81-mbstring \
        php81-mysqli \
        php81-opcache \
        php81-pdo \
        php81-pdo_mysql \
        php81-pdo_sqlite \
        php81-pecl-apcu \
        php81-phar \
        php81-posix \
        php81-redis \
        php81-simplexml \
        php81-soap \
        php81-sockets \
        php81-sodium \
        php81-tokenizer \
        php81-xml \
        php81-xmlreader \
        php81-xmlwriter \
        php81-zip \
        php81-zlib \
    && ln -sf /usr/bin/php81 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php81

ENV PHP_DISPLAY_ERRORS On
ENV PHP_MAX_EXECUTION_TIME -1
ENV PHP_MEMORY_LIMIT -1
ENV PHP_OPCACHE_REVALIDATE_FREQ 0
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS 0
ENV PHP_UPLOAD_MAX_FILESIZE 8M
ENV PHP_SESSION_SAVE_HANDLER files
ENV PHP_SESSION_SAVE_PATH /tmp
ENV PHP_SESSION_GC_MAXLIFETIME 1440

COPY conf.d/* /etc/php81/conf.d/

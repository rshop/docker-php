FROM alpine:edge

ENV PHPIZE_DEPS="autoconf automake dpkg dpkg-dev file g++ gcc libc-dev libtool make pcre-dev pcre2-dev php85-dev php85-pear pkgconf re2c zlib-dev"

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        php85 \
        php85-pecl-apcu \
        php85-bcmath \
        php85-bz2 \
        php85-calendar \
        php85-ctype \
        php85-curl \
        php85-dom \
        php85-fileinfo \
        php85-ftp \
        php85-gd \
        php85-iconv \
        php85-intl \
        php85-mbstring \
        php85-mysqli \
        php85-pdo \
        php85-pdo_mysql \
        php85-pdo_pgsql \
        php85-pdo_sqlite \
        php85-pgsql \
        php85-phar \
        php85-posix \
        php85-redis \
        php85-simplexml \
        php85-soap \
        php85-sockets \
        php85-sodium \
        php85-tokenizer \
        php85-xml \
        php85-xmlreader \
        php85-xmlwriter \
        php85-zip \
        php85-zlib \
    && ln -sf /usr/bin/php85 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php85

ENV PHP_DISPLAY_ERRORS On
ENV PHP_MAX_EXECUTION_TIME -1
ENV PHP_MEMORY_LIMIT -1
ENV PHP_OPCACHE_REVALIDATE_FREQ 0
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS 0
ENV PHP_UPLOAD_MAX_FILESIZE 8M
ENV PHP_SESSION_SAVE_HANDLER files
ENV PHP_SESSION_SAVE_PATH /tmp
ENV PHP_SESSION_GC_MAXLIFETIME 1440

COPY conf.d/* /etc/php85/conf.d/
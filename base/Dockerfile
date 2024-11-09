FROM alpine:3.15

ENV PHPIZE_DEPS="autoconf automake dpkg dpkg-dev file g++ gcc libc-dev libtool make pcre-dev pcre2-dev php8-dev php8-pear pkgconf re2c zlib-dev"

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        php8 \
        php8-bcmath \
        php8-bz2 \
        php8-calendar \
        php8-ctype \
        php8-curl \
        php8-dom \
        php8-fileinfo \
        php8-ftp \
        php8-gd \
        php8-iconv \
        php8-imap \
        php8-intl \
        php8-mbstring \
        php8-mysqli \
        php8-opcache \
        php8-pdo \
        php8-pdo_mysql \
        php8-pdo_sqlite \
        php8-pecl-apcu \
        php8-pecl-mcrypt \
        php8-phar \
        php8-posix \
        php8-redis \
        php8-simplexml \
        php8-soap \
        php8-sockets \
        php8-sodium \
        php8-tokenizer \
        php8-xml \
        php8-xmlreader \
        php8-xmlwriter \
        php8-zip \
        php8-zlib \
    && ln -sf /usr/bin/php8 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php8

ENV PHP_DISPLAY_ERRORS On
ENV PHP_MAX_EXECUTION_TIME -1
ENV PHP_MEMORY_LIMIT -1
ENV PHP_OPCACHE_REVALIDATE_FREQ 0
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS 0
ENV PHP_UPLOAD_MAX_FILESIZE 8M
ENV PHP_SESSION_SAVE_HANDLER files
ENV PHP_SESSION_SAVE_PATH /tmp
ENV PHP_SESSION_GC_MAXLIFETIME 1440

COPY conf.d/* /etc/php8/conf.d/

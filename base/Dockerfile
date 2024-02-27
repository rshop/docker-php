FROM alpine:edge

ENV PHPIZE_DEPS="autoconf automake dpkg dpkg-dev file g++ gcc libc-dev libtool make pcre-dev pcre2-dev php83-dev php83-pear pkgconf re2c zlib-dev"

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        php83 \
        php83-pecl-apcu \
        php83-bcmath \
        php83-bz2 \
        php83-calendar \
        php83-ctype \
        php83-curl \
        php83-dom \
        php83-fileinfo \
        php83-ftp \
        php83-gd \
        php83-iconv \
        php83-imap \
        php83-intl \
        php83-mbstring \
        php83-pecl-mcrypt \
        php83-mysqli \
        php83-opcache \
        php83-pdo \
        php83-pdo_mysql \
        php83-pdo_sqlite \
        php83-phar \
        php83-posix \
        php83-redis \
        php83-simplexml \
        php83-soap \
        php83-sockets \
        php83-sodium \
        php83-tokenizer \
        php83-xml \
        php83-xmlreader \
        php83-xmlwriter \
        php83-zip \
        php83-zlib \
    && ln -sf /usr/bin/php83 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php83

ENV PHP_DISPLAY_ERRORS On
ENV PHP_MAX_EXECUTION_TIME -1
ENV PHP_MEMORY_LIMIT -1
ENV PHP_OPCACHE_REVALIDATE_FREQ 0
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS 0
ENV PHP_UPLOAD_MAX_FILESIZE 8M
ENV PHP_SESSION_SAVE_HANDLER files
ENV PHP_SESSION_SAVE_PATH /tmp
ENV PHP_SESSION_GC_MAXLIFETIME 1440

COPY conf.d/* /etc/php83/conf.d/
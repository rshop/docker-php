FROM alpine:edge

ENV PHPIZE_DEPS="autoconf automake dpkg dpkg-dev file g++ gcc libc-dev libtool make pcre-dev pcre2-dev php82-dev php82-pear pkgconf re2c zlib-dev"

RUN set -ex \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        php82 \
        php82-bcmath \
        php82-bz2 \
        php82-calendar \
        php82-ctype \
        php82-curl \
        php82-dom \
        php82-fileinfo \
        php82-ftp \
        php82-gd \
        php82-iconv \
        php82-imap \
        php82-intl \
        php82-mbstring \
        php82-mysqli \
        php82-opcache \
        php82-pdo \
        php82-pdo_mysql \
        php82-pdo_sqlite \
        php82-pecl-apcu \
        php82-phar \
        php82-posix \
        php82-redis \
        php82-simplexml \
        php82-soap \
        php82-sockets \
        php82-sodium \
        php82-tokenizer \
        php82-xml \
        php82-xmlreader \
        php82-xmlwriter \
        php82-zip \
        php82-zlib \
    && ln -sf /usr/bin/php82 /usr/bin/php \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/share/php82

ENV PHP_DISPLAY_ERRORS On
ENV PHP_MAX_EXECUTION_TIME -1
ENV PHP_MEMORY_LIMIT -1
ENV PHP_OPCACHE_REVALIDATE_FREQ 0
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS 0
ENV PHP_UPLOAD_MAX_FILESIZE 8M
ENV PHP_SESSION_SAVE_HANDLER files
ENV PHP_SESSION_SAVE_PATH /tmp
ENV PHP_SESSION_GC_MAXLIFETIME 1440

COPY conf.d/* /etc/php82/conf.d/

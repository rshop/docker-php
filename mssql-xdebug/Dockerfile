FROM rshop/php:7.3-mssql

RUN apk update \
    && apk add --no-cache \
        php7-pecl-xdebug \
    && echo "zend_extension=xdebug.so" > /etc/php7/conf.d/xdebug.ini \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

COPY conf.d/* /etc/php7/conf.d/

ENV PHP_XDEBUG_MAX_NESTING_LEVEL 250
ENV PHP_XDEBUG_REMOTE_HOST docker.for.mac.localhost

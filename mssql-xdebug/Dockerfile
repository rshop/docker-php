FROM rshop/php:8.1-mssql

RUN apk update \
    && apk add --no-cache \
        php81-pecl-xdebug \
    && echo "zend_extension=xdebug.so" > /etc/php81/conf.d/xdebug.ini \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

ENV PHP_XDEBUG_MAX_NESTING_LEVEL 250
ENV PHP_XDEBUG_REMOTE_HOST docker.for.mac.localhost

COPY conf.d/* /etc/php81/conf.d/

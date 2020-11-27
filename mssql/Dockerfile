

FROM microsoft/mssql-tools as mssql
FROM rshop/php:7.3

COPY --from=mssql /opt/microsoft/ /opt/microsoft/
COPY --from=mssql /opt/mssql-tools/ /opt/mssql-tools/
COPY --from=mssql /usr/lib/libmsodbcsql-13.so /usr/lib/libmsodbcsql-13.so

RUN apk update \
    && apk add --no-cache \
        unixodbc \
    && apk add --no-cache --virtual .build-deps \
        autoconf \
        automake \
        dpkg \
        dpkg-dev \
        file \
        freetds-dev \
        g++ \
        gcc \
        libc-dev \
        libtool \
        make \
        pcre-dev \
        pcre2-dev \
        php7-dev \
        php7-pear \
        pkgconf \
        re2c \
        unixodbc-dev \
        zlib-dev \
    && pecl install sqlsrv pdo_sqlsrv \
    && echo "extension=sqlsrv.so" > /etc/php7/conf.d/50_sqlsrv.ini \
    && echo "extension=pdo_sqlsrv.so" > /etc/php7/conf.d/50_pdo_sqlsrv.ini \
    && apk del .build-deps \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

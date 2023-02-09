FROM rshop/php:8.1

RUN apk update \
    && wget https://download.microsoft.com/download/8/6/8/868e5fc4-7bfe-494d-8f9d-115cbcdb52ae/msodbcsql18_18.1.2.1-1_amd64.apk \
    && apk add --allow-untrusted msodbcsql18_18.1.2.1-1_amd64.apk \
    && rm msodbcsql18_18.1.2.1-1_amd64.apk \
    && wget https://download.microsoft.com/download/8/6/8/868e5fc4-7bfe-494d-8f9d-115cbcdb52ae/mssql-tools18_18.1.1.1-1_amd64.apk \
    && apk add --allow-untrusted mssql-tools18_18.1.1.1-1_amd64.apk \
    && rm mssql-tools18_18.1.1.1-1_amd64.apk \
    && apk add --no-cache \
        unixodbc \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        freetds-dev \
        unixodbc-dev \
    && pecl81 channel-update pecl.php.net \
    && pecl81 install sqlsrv pdo_sqlsrv \
    && echo "extension=sqlsrv.so" > /etc/php81/conf.d/50_sqlsrv.ini \
    && echo "extension=pdo_sqlsrv.so" > /etc/php81/conf.d/50_pdo_sqlsrv.ini \
    && apk del .build-deps \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && chown -R root:root /opt

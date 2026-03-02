FROM rshop/php:8.3

RUN apk update \
    && curl -kO https://download.microsoft.com/download/9dcab408-e0d4-4571-a81a-5a0951e3445f/msodbcsql18_18.6.1.1-1_amd64.apk \
    && apk add --allow-untrusted msodbcsql18_18.6.1.1-1_amd64.apk \
    && rm msodbcsql18_18.6.1.1-1_amd64.apk \
    && curl -kO https://download.microsoft.com/download/b60bb8b6-d398-4819-9950-2e30cf725fb0/mssql-tools18_18.6.1.1-1_amd64.apk \
    && apk add --allow-untrusted mssql-tools18_18.6.1.1-1_amd64.apk \
    && rm mssql-tools18_18.6.1.1-1_amd64.apk \
    && apk add --no-cache \
        unixodbc \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        freetds-dev \
        unixodbc-dev \
    && pecl83 channel-update pecl.php.net \
    && pecl83 install sqlsrv pdo_sqlsrv \
    && echo "extension=sqlsrv.so" > /etc/php83/conf.d/50_sqlsrv.ini \
    && echo "extension=pdo_sqlsrv.so" > /etc/php83/conf.d/50_pdo_sqlsrv.ini \
    && apk del .build-deps \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && chown -R root:root /opt

COPY conf.d/* /etc/php83/conf.d/
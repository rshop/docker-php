FROM rshop/php:8.4

RUN apk update \
    && wget https://download.microsoft.com/download/1/f/f/1fffb537-26ab-4947-a46a-7a45c27f6f77/msodbcsql18_18.2.1.1-1_amd64.apk \
    && apk add --allow-untrusted msodbcsql18_18.2.1.1-1_amd64.apk \
    && rm msodbcsql18_18.2.1.1-1_amd64.apk \
    && wget https://download.microsoft.com/download/1/f/f/1fffb537-26ab-4947-a46a-7a45c27f6f77/mssql-tools18_18.2.1.1-1_amd64.apk \
    && apk add --allow-untrusted mssql-tools18_18.2.1.1-1_amd64.apk \
    && rm mssql-tools18_18.2.1.1-1_amd64.apk \
    && apk add --no-cache \
        unixodbc \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        freetds-dev \
        unixodbc-dev \
    && pecl84 channel-update pecl.php.net \
    && pecl84 install sqlsrv pdo_sqlsrv \
    && echo "extension=sqlsrv.so" > /etc/php84/conf.d/50_sqlsrv.ini \
    && echo "extension=pdo_sqlsrv.so" > /etc/php84/conf.d/50_pdo_sqlsrv.ini \
    && apk del .build-deps \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && chown -R root:root /opt

COPY conf.d/* /etc/php84/conf.d/
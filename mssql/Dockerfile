FROM rshop/php:7.3

RUN apk update \
    && wget https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.7.2.1-1_amd64.apk \
    && apk add --allow-untrusted msodbcsql17_17.7.2.1-1_amd64.apk \
    && rm msodbcsql17_17.7.2.1-1_amd64.apk \
    && wget https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.7.1.1-1_amd64.apk \
    && apk add --allow-untrusted mssql-tools_17.7.1.1-1_amd64.apk \
    && rm mssql-tools_17.7.1.1-1_amd64.apk \
    && apk add --no-cache \
        unixodbc \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        freetds-dev \
        unixodbc-dev \
    && pecl channel-update pecl.php.net \
    && pecl install sqlsrv-5.9.0 pdo_sqlsrv-5.9.0 \
    && echo "extension=sqlsrv.so" > /etc/php7/conf.d/50_sqlsrv.ini \
    && echo "extension=pdo_sqlsrv.so" > /etc/php7/conf.d/50_pdo_sqlsrv.ini \
    && apk del .build-deps \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && chown -R root:root /opt

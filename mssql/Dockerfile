FROM alpine:edge AS mssql

RUN apk update \
    && apk add --no-cache \
        curl \
    && curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.7.2.1-1_amd64.apk \
    && curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.7.1.1-1_amd64.apk \
    && apk add --allow-untrusted msodbcsql17_17.7.2.1-1_amd64.apk \
    && apk add --allow-untrusted mssql-tools_17.7.1.1-1_amd64.apk

FROM rshop/php:7.4

COPY --from=mssql /opt/microsoft/ /opt/microsoft/
COPY --from=mssql /opt/mssql-tools/ /opt/mssql-tools/

RUN apk update \
    && apk add --no-cache \
        unixodbc \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        freetds-dev \
        unixodbc-dev \
    && pecl channel-update pecl.php.net \
    && pecl install sqlsrv pdo_sqlsrv \
    && echo "extension=sqlsrv.so" > /etc/php7/conf.d/50_sqlsrv.ini \
    && echo "extension=pdo_sqlsrv.so" > /etc/php7/conf.d/50_pdo_sqlsrv.ini \
    && apk del .build-deps \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man

FROM rshop/php:8.2

RUN apk update \
    && ARCH=$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/') \
    && curl -kO https://download.microsoft.com/download/9dcab408-e0d4-4571-a81a-5a0951e3445f/msodbcsql18_18.6.1.1-1_${ARCH}.apk \
    && apk add --allow-untrusted msodbcsql18_18.6.1.1-1_${ARCH}.apk \
    && rm msodbcsql18_18.6.1.1-1_${ARCH}.apk \
    && curl -kO https://download.microsoft.com/download/b60bb8b6-d398-4819-9950-2e30cf725fb0/mssql-tools18_18.6.1.1-1_${ARCH}.apk \
    && apk add --allow-untrusted mssql-tools18_18.6.1.1-1_${ARCH}.apk \
    && rm mssql-tools18_18.6.1.1-1_${ARCH}.apk \
    && apk add --no-cache \
        unixodbc \
    && apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        freetds-dev \
        unixodbc-dev \
    && pecl82 channel-update pecl.php.net \
    && pecl82 install sqlsrv-5.12.0 pdo_sqlsrv-5.12.0 \
    && echo "extension=sqlsrv.so" > /etc/php82/conf.d/50_sqlsrv.ini \
    && echo "extension=pdo_sqlsrv.so" > /etc/php82/conf.d/50_pdo_sqlsrv.ini \
    && apk del .build-deps \
    && apk del --purge *-dev \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && chown -R root:root /opt

COPY conf.d/* /etc/php82/conf.d/
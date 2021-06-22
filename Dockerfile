FROM php:7.4-cli-alpine

RUN apk add --no-cache --virtual .my-deps g++ autoconf &&\
    apk add --no-cache git bash openssh-client make &&\
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    apk del .my-deps

COPY php.ini /usr/local/etc/php/conf.d

WORKDIR /app
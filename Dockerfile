ARG PHP_VERSION=8.1

FROM php:${PHP_VERSION}-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    nano

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN git clone https://github.com/xdebug/xdebug.git
RUN cd xdebug && phpize && ./configure && make && make install

COPY docker/php/php-xdebug.ini /usr/local/etc/php/php.ini
COPY docker/nginx/conf.d/default.conf etc/nginx/conf.d

WORKDIR /app
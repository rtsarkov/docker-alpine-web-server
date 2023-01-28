FROM php:8.0-fpm-alpine

RUN apk add --update --no-cache autoconf
RUN apk add --update --no-cache wget
RUN apk add --update --no-cache curl
RUN apk add --update --no-cache git
RUN apk add --update --no-cache bash
RUN apk add --update --no-cache libjpeg-turbo-dev
RUN apk add --update --no-cache libwebp-dev
RUN apk add --update --no-cache libmcrypt-dev
RUN apk add --update --no-cache libpng-dev
RUN apk add --update --no-cache unzip
RUN apk add --update --no-cache nano
RUN apk add --update --no-cache freetype-dev
RUN apk add --update --no-cache curl-dev
RUN apk add --update --no-cache libzip-dev

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


RUN docker-php-ext-configure gd --with-freetype --with-jpeg

# Install xdebug
# RUN pecl install xdebug-2.8.0 && \
#     docker-php-ext-enable xdebug


# Install php dependencies
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install curl
# RUN docker-php-ext-install json
RUN docker-php-ext-install  zip
RUN apk add --update --no-cache oniguruma-dev
RUN docker-php-ext-install  mbstring
RUN docker-php-ext-enable mbstring
RUN docker-php-ext-install  opcache

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install gd

COPY ./php.ini /usr/local/etc/php/conf.d/php.ini


RUN docker-php-ext-install \
        sockets

RUN set -x \
        && deluser www-data \
        && addgroup -g 500 -S www-data \
        && adduser -u 500 -D -S -G www-data www-data


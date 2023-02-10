FROM php:8.0-fpm-alpine

RUN apk add --update --no-cache \
    autoconf \
    wget \
    curl \
    git \
    bash \
    libjpeg-turbo-dev \
    libwebp-dev \
    libmcrypt-dev \
    libpng-dev \
    unzip \
    nano \
    freetype-dev \
    curl-dev \
    libzip-dev

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


RUN docker-php-ext-configure gd --with-freetype --with-jpeg


# Install php dependencies
RUN docker-php-ext-install pdo_mysql \
    mysqli \
    curl \
    zip \
    opcache

RUN apk add --update --no-cache oniguruma-dev
RUN docker-php-ext-install  mbstring
RUN docker-php-ext-enable mbstring

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install gd
   

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS
RUN apk add --update linux-headers
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

COPY ./php.ini /usr/local/etc/php/conf.d/php.ini

USER root
RUN mkdir /tmp/session

RUN if getent passwd www-data; then \
    deluser www-data &&\
    if getent group www-data ; then groupdel www-data; fi &&\
    addgroup -g 1000 -S www-data &&\
    adduser -u 1000 -D -S -G www-data www-data &&\
    install -d -m 0755 -o www-data -g www-data /var/www/html &&\
    chown -R 1000:1000 \
        /var/www/html \
        /tmp/session &&\
    chmod -R 0777 \
        /var/www/html \
        /tmp/session \
;fi

USER www-data
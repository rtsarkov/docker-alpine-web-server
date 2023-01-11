FROM php:7.4-fpm-alpine

RUN apk add \
    autoconf \
    wget \
    curl \
    git \
    php7-xdebug \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Install xdebug
# RUN pecl install xdebug-2.8.0 && \
#     docker-php-ext-enable xdebug


# Other PHP7 Extensions
# RUN docker-php-ext-install pdo_mysql
# RUN docker-php-ext-install mysqli
# RUN docker-php-ext-install curl
# RUN docker-php-ext-install tokenizer
# RUN docker-php-ext-install json
# RUN docker-php-ext-install zip
# RUN docker-php-ext-install -j$(nproc) intl
# RUN docker-php-ext-install mbstring
# RUN docker-php-ext-install opcache
FROM php:7.4-fpm-alpine

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
    libzip-dev && \
    rm -rf /var/cache/apk/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


#RUN docker-php-ext-configure gd --with-freetype --with-jpeg


# Install php dependencies
RUN docker-php-ext-install \
    pdo_mysql \
    mysqli \
    curl \
    json \
    zip \
    opcache
RUN apk add --update --no-cache oniguruma-dev
RUN docker-php-ext-install  mbstring
RUN docker-php-ext-enable mbstring

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install gd



ENV XDEBUG_VERSION 2.8.0
RUN apk --no-cache add --virtual .build-deps \
        g++ \
        autoconf \
        make && \
    pecl install xdebug-$XDEBUG_VERSION && \
    docker-php-ext-enable xdebug && \
    apk del .build-deps && \
    rm -r /tmp/pear/*


COPY ./php.ini /usr/local/etc/php/conf.d/php.ini
## mhsendmail for MailHog (https://github.com/mailhog/mhsendmail)
RUN apk update && apk add \
    go \
    git
RUN mkdir /root/go
ENV GOPATH=/root/go
ENV PATH=$PATH:$GOPATH/bin
RUN go install github.com/mailhog/mhsendmail@latest
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail

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

RUN apk update && apk add msmtp postfix
#RUN mkfifo /var/spool/postfix/public/pickup

#COPY msmtprc /etc/msmtprc



USER www-data



FROM php:7.1-fpm-alpine

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions \
    gd \
    zip \
    mbstring \
    json \
    xml \
    session \
    mysqli \
    pdo_mysql \
    tokenizer \
    mcrypt \
    xdebug

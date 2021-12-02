ARG ARG_PHP_VERSION=7.1
ARG ARG_IMAGE_DISTRO=buster

FROM php:${ARG_PHP_VERSION}-fpm-${ARG_IMAGE_DISTRO}

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
    xdebug \
    imagick

COPY php.ini /usr/local/etc/php/php.ini

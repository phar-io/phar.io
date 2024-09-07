ARG PHP_VERSION=8.2.7
ARG DEBIAN_RELEASE=bullseye

FROM php:${PHP_VERSION}-fpm-${DEBIAN_RELEASE}

ENV DEBIAN_FRONTEND noninteractive
ENV DOCKER_PHP_DEPS \
    libxml2-dev \
    libzip-dev \
    unzip
ENV XDEBUG_VERSION 3.2.1

RUN set -xe; \
    apt-get --allow-releaseinfo-change update && \
    apt-get install -y -qq ${DOCKER_PHP_DEPS} --no-install-suggests --no-install-recommends && \
    docker-php-ext-install -j$(nproc) xml && \
    docker-php-ext-install -j$(nproc) zip && \
    pecl install xdebug-${XDEBUG_VERSION} && docker-php-ext-enable xdebug

RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean

# Copy php configs
COPY .docker/php/conf.d/*.ini /usr/local/etc/php/conf.d/

WORKDIR /app

COPY . ./

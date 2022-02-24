FROM php:8.1

LABEL org.opencontainers.image.source="https://github.com/MilesChou/docker-xdebug" \
    repository="https://github.com/MilesChou/docker-xdebug" \
    maintainer="MilesChou <jangconan@gmail.com>"

# install xdebug
RUN set -xe && \
        docker-php-source extract && \
        pecl install xdebug && \
        docker-php-ext-enable xdebug && \
        docker-php-source delete && \
        php -v && \
        php -m

RUN set -xe && \
        curl -LOs https://phar.phpunit.de/phpunit.phar \
        && \
        chmod +x phpunit.phar \
        && \
        mv phpunit.phar /usr/local/bin/phpunit

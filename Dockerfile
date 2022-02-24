FROM php:8.1

RUN set -xe && \
        curl -LOs https://phar.phpunit.de/phpunit.phar \
        && \
        chmod +x phpunit.phar \
        && \
        mv phpunit.phar /usr/local/bin/phpunit \
        && \
        phpunit -v

ENTRYPOINT ["/usr/local/bin/phpunit"]
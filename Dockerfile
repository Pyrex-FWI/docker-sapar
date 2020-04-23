FROM alpine:3.11
#FROM php:7.4-alpine3.11

RUN addgroup -S www \
    && adduser -S -G www www

RUN apk add --update \
    php7-apcu \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-gd \
    php7-iconv \
    php7-imagick \
    php7-json \
    php7-intl \
    php7-mcrypt \
    php7-fileinfo \
#    php7-fpm \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-xml \
    php7-zlib \
    php7-phar \
    php7-tokenizer \
    php7-session \
    php7-simplexml \
    php7-xmlwriter \
    php7-xdebug \
    php7-xsl \
    php7-zip \
    php7-sqlite3 \
    php7-pdo_sqlite \
    make \
    curl \
    nodejs \
    yarn \
    bash \
    wget

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
    curl --insecure https://getcomposer.org/download/1.10.5/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer \
    && wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony/bin/symfony /usr/bin/symfony && chmod +x /usr/bin/symfony

#ADD php.ini /etc/php7/conf.d/
#ADD php.ini /etc/php7/cli/conf.d/
#ADD php-fpm.conf /etc/php7/php-fpm.d/
#ADD xdebug.ini  /etc/php7/conf.d/

WORKDIR /var/www/

EXPOSE 8000

#CMD ["php-fpm7", "-F"]
#CMD ["php", "-v"]
CMD ["symfony", "server:start"]

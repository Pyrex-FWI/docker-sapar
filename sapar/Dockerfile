FROM alpine:3.11
##FROM php:7.4-alpine3.11

ENV MUSL_LOCPATH /usr/share/i18n/locales/musl
ENV LC_ALL fr_FR.UTF-8
ENV LANG fr_FR.UTF-8

#Monorepo issue with iconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN addgroup -S www \
    && adduser -S -G www www

RUN apk add --no-cache \
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
#    php7-xdebug \
    php7-pecl-xdebug \
    php7-xsl \
    php7-zip \
    php7-sqlite3 \
    php7-pdo_sqlite \
    php7-pecl-amqp \
    make \
    curl \
    nodejs \
    yarn \
    bash \
    cmake make musl-dev gcc gettext-dev libintl \
    wget \
    git \
    supervisor \
    openssh \
    mediainfo beets flac ffmpeg \
    && pip3 install --upgrade pip && \
    pip3 install  --no-cache-dir eyeD3 eyeD3[display-plugin]

RUN rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
    curl --insecure https://getcomposer.org/download/1.10.5/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer \
    && wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony/bin/symfony /usr/bin/symfony && chmod +x /usr/bin/symfony \
    && ln -s /usr/bin/mediainfo /usr/local/bin/ \
    && ln -s /usr/bin/eyeD3 /usr/local/bin/eyeD3

#Locales https://grrr.tech/posts/2020/add-locales-to-alpine-linux-docker-image/
RUN wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
    && unzip musl-locales-master.zip \
      && cd musl-locales-master \
      && cmake -DLOCALE_PROFILE=OFF -D CMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install \
      && cd .. && rm -rf musl-locales-master musl-locales-master.zip

ADD php.ini /etc/php7/conf.d/
ADD php.ini /etc/php7/cli/conf.d/
ADD php-fpm.conf /etc/php7/php-fpm.d/
#ADD xdebug.ini  /etc/php7/conf.d/

#Monorepo issue with iconv
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv

WORKDIR /var/www/

EXPOSE 8000

#CMD ["php-fpm7", "-F"]
#CMD ["php", "-v"]
CMD ["symfony", "server:start"]

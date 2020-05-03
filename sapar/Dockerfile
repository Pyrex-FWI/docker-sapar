FROM yemistikris/docker-sapar:base

ADD .env /var/www/.env
ADD App/Symfony4 /var/www/App/Symfony4
ADD App/Symfony5 /var/www/App/Symfony5

WORKDIR /var/www/

ENV APP_ENV prod
RUN php -dmemory_limit=-1 /usr/bin/composer update --no-dev -d App/Symfony4 -n
RUN php -dmemory_limit=-1 /usr/bin/composer update --no-dev -d App/Symfony5 -n
RUN php App/Symfony5/bin/console doctrine:schema:update --force -n

EXPOSE 8000

#CMD ["php-fpm7", "-F"]
#CMD ["php", "-v"]
CMD ["symfony", "server:start"]

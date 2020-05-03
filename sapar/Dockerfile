FROM yemistikris/docker-sapar:base

ADD .env /var/www/.env
ADD App/Symfony4 /var/www/App/Symfony4
ADD App/Symfony5 /var/www/App/Symfony5

WORKDIR /var/www/

RUN php -dmemory_limit=-1 /usr/bin/composer update --no-dev -d App/Symfony5

EXPOSE 8000

#CMD ["php-fpm7", "-F"]
#CMD ["php", "-v"]
CMD ["symfony", "server:start"]

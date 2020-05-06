FROM yemistikris/docker-sapar:base

ADD --chown=www:www .env /var/www/.env
ADD --chown=www:www App/Symfony4 /var/www/App/Symfony4
ADD --chown=www:www App/Symfony5 /var/www/App/Symfony5
ADD App/Symfony5/config/supervisor/messenger-worker.conf /etc/supervisor.d/messenger-worker.ini

WORKDIR /var/www/

ENV APP_ENV prod
RUN php -dmemory_limit=-1 /usr/bin/composer update --no-dev -d App/Symfony4 -n
RUN php -dmemory_limit=-1 /usr/bin/composer update --no-dev -d App/Symfony5 -n
RUN php App/Symfony5/bin/console doctrine:schema:update --force -n

ADD Devops/scripts /var/www/Devops/scripts
RUN ["chmod", "+x", "/var/www/Devops/scripts/wait-for-it.sh"]
EXPOSE 8000

#CMD ["php-fpm7", "-F"]
#CMD ["php", "-v"]
CMD ["symfony", "server:start"]

#!/bin/bash

cp -R -u -p .env.development .env
sleep 1
composer install

chown -R www-data: /var/www/
chown -R 1000: /var/www/.docker/dbdata
chmod 777 -R /var/www/

php artisan migrate
sleep 1
php artisan cache:clear
#php artisan key:generate
sleep 1
php artisan config:cache

php-fpm

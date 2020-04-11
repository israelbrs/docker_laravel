#!/bin/bash
composer install

cp .env.example .env
chown -R www-data: /var/www/
chown -R 1000: /var/www/.docker/dbdata
chmod 777 -R /var/www/

sleep 2

php artisan migrate &&
    php artisan cache:clear &&
    php artisan key:generate &&
    php artisan config:cache

php-fpm

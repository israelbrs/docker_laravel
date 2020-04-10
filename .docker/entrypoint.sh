#!/bin/bash
composer install

chown -R www-data: /var/www/
chown -R 1000: /var/www/.docker/dbdata
chmod 777 -R /var/www/
cp .env.example .env

php artisan migrate
php artisan key:generate

php artisan cache:clear
php artisan config:cache

php-fpm

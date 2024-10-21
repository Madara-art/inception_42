#!/bin/bash

# while true
# do
#   sleep 5
# done
# ln -sf /dev/stdout /var/log/php7.x-fpm-access.log

mkdir -p /run/php

if [ -f "/var/www/wordpress/wp-config.php" ]; then
    echo wordpress already installed.
else
    echo "Installing wordpress..."
    cd /var/www/wordpress
    wp core download  --allow-root
    wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb --allow-root 
    wp core install  --url="https://hbouabda.42.fr" --title="WTF" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root
fi
# --path=/var/www/wordpress


exec "$@"
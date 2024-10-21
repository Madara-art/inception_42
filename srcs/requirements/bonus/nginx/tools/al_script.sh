#!/bin/bash

# while true
# do
#   sleep 5
# done

# mkdir /tinyfilemanager

mkdir -p /etc/nginx/ssl

envsubst '${SSL_PRIVATE_KEY_PATH} ${SSL_CERT_PATH}' \
        < /etc/nginx/nginx.conf.template \
        > /etc/nginx/nginx.conf

chown -R www-data:www-data /var/www/wordpress/ 
# chown -R www-data:www-data /tinyfilemanager
# chmod -R 775 /tinyfilemanager
chmod -R 775 /var/www/wordpress
# chown -R www-data:www-data /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout $SSL_PRIVATE_KEY_PATH -out $SSL_CERT_PATH \
    -subj "/C=MA/ST=Angad/L=Oujda/O=UM6P/OU=1337/CN=hbouabda.42.fr"

nginx -g "daemon off;"

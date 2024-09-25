#!/bin/bash

# while true
# do
#   sleep 5
# done

envsubst '${SSL_PRIVATE_KEY_PATH} ${SSL_CERT_PATH}' \
        < /etc/nginx/nginx.conf.template \
        > /etc/nginx/nginx.conf

mkdir -p /etc/nginx/ssl
chown -R www-data:www-data /var/www/wordpress/ 
# chown -R www-data:www-data /etc/nginx/ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout $SSL_PRIVATE_KEY_PATH -out $SSL_CERT_PATH \
    -subj "/C=MA/ST=Angad/L=Oujda/O=UM6P/OU=1337/CN=hbouabda.42.fr"

nginx -g "daemon off;"

#!/bin/bash

echo "
env[tinyfilemanager_user] = $tinyfilemanager_user
env[tinyfilemanager_password] = $tinyfilemanager_password 
" >> /etc/php/7.4/fpm/pool.d/www.conf

exec "$@"
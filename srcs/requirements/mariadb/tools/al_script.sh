#!/bin/bash
# while true
# do
#   sleep 30
# done

# chown -R mysql:mysql /var/lib/mysql
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql #?
fi
# echo here
service mariadb start
# echo here
mysql -v -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"
# echo here 
mysql -v -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -v -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -v -e "FLUSH PRIVILEGES;"
service mariadb stop

exec mysqld #--bind 0.0.0.0
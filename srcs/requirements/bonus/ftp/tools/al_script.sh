#!/bin/bash

# while true
# do
#   sleep 5
# done

useradd -m -d /home/$FTP_USER -s /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
ln -s /var/www/wordpress /home/$FTP_USER/wordpress
chown -h $FTP_USER:$FTP_USER /home/$FTP_USER/wordpress
usermod -aG www-data $FTP_USER
mkdir -p /var/run/vsftpd/empty

exec "$@"
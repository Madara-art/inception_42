FROM debian:11

RUN apt-get update && apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -d /home/ftpuser -s /bin/bash ftpuser && echo "ftpuser:ftpuser_password" | chpasswd
RUN ln -s /var/www/wordpress /home/ftpuser/wordpress
RUN chown -h ftpuser:ftpuser /home/ftpuser/wordpress

RUN usermod -aG www-data ftpuser

RUN mkdir -p /var/run/vsftpd/empty

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

EXPOSE 21

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]

# COPY ./tools/al_script.sh /bin/

# RUN chmod +x /bin/al_script.sh

# CMD ["al_script.sh"]
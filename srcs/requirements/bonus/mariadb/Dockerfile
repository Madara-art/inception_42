FROM debian:11

RUN apt-get update && \
    apt-get install --no-install-recommends mariadb-server -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3306

COPY ./conf/60-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/al_script.sh /bin/

RUN chmod +x /bin/al_script.sh

CMD ["al_script.sh"]
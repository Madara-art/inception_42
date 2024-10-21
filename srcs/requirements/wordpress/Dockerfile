FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y --no-install-recommends php7.4-fpm php7.4-mysql curl ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
    

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./tools/al_script.sh /bin/ 

RUN	chmod +x /bin/al_script.sh

ENTRYPOINT ["al_script.sh"]

CMD ["php-fpm7.4", "--nodaemonize"]

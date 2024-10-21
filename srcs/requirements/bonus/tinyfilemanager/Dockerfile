FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php7.4 \
    curl \
    php7.4-fpm \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tinyfilemanager /wordpress/
WORKDIR /tinyfilemanager

RUN curl -O https://raw.githubusercontent.com/prasathmani/tinyfilemanager/refs/heads/master/tinyfilemanager.php \
    && mv tinyfilemanager.php index.php 

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php
RUN chown -R www-data:www-data /wordpress/
COPY ./conf/index.php .

EXPOSE 1337

COPY tools/al_script.sh /bin/

RUN chmod +x /bin/al_script.sh

# CMD ["php", "-S", "0.0.0.0:1337", "-t", "/var/www/html"]
ENTRYPOINT ["al_script.sh"]

CMD ["php-fpm7.4", "--nodaemonize"]

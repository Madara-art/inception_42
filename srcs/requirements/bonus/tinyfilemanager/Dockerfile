FROM debian:11

RUN apt-get update && apt-get install -y \
    php7.4 \
    curl \
    php7.4-fpm \
    && rm -rf /var/lib/apt/lists/*
    # unzip \
    # apt-get install -y --no-install-recommends php7.4-fpm php7.4-mysql \
RUN mkdir /tinyfilemanager
WORKDIR /tinyfilemanager

# RUN wget https://github.com/prasathmani/tinyfilemanager/archive/refs/heads/master.zip -O tinyfilemanager.zip \
#     && unzip tinyfilemanager.zip \
RUN curl -O https://raw.githubusercontent.com/prasathmani/tinyfilemanager/refs/heads/master/tinyfilemanager.php \
    && mv tinyfilemanager.php index.php 
    # && rm -rf tinyfilemanager.zip tinyfilemanager-master

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /run/php
RUN chown -R www-data:www-data /tinyfilemanager/
# COPY ./conf/index.php .

EXPOSE 1337

# CMD ["php", "-S", "0.0.0.0:1337", "-t", "/var/www/html"]
CMD ["php-fpm7.4", "--nodaemonize"]

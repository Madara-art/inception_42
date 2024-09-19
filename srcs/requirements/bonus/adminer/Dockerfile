FROM debian:11

RUN apt-get update && apt-get install -y \
    wget \
    php \
    php-mysqli \
    && apt-get clean

RUN mkdir -p /app/adminer

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /app/adminer/index.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/app/adminer"]

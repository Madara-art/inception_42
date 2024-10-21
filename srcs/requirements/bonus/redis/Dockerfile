FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y redis-server && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 6379

# COPY ./tools/al_script.sh /bin/

# RUN chmod +x /bin/al_script.sh

COPY ./conf/redis.conf /etc/redis/

CMD ["redis-server", "/etc/redis/redis.conf"]
FROM debian:bullseye
RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log


COPY tools/al_script.sh /bin/

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /bin/al_script.sh

# RUN chown -R www-data:www-data /var/www/wordpress

EXPOSE 443

CMD ["al_script.sh"] 
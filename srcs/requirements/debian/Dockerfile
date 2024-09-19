FROM debian:11

RUN apt-get update && apt-get install -y mariadb-client fish libfcgi-bin curl

COPY ./tools/al_script.sh /bin/

RUN chmod +x /bin/al_script.sh

CMD ["al_script.sh"]
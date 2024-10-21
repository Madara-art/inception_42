FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd && \
    rm -rf /var/lib/apt/lists/*


COPY ./tools/al_script.sh /bin/

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod +x /bin/al_script.sh

EXPOSE 21

ENTRYPOINT ["al_script.sh"]

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]

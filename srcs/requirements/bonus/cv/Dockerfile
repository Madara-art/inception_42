FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    python3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/cv

COPY ./tools/* .

EXPOSE 8000

CMD ["python3", "-m", "http.server", "8000"]
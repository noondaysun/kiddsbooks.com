FROM nginx/unit:1.18.0-php7.3

RUN apt-get update && \
    apt-get install --no-install-recommends --no-install-suggests -y apt-utils php7.3-xml php7.3-json

COPY ./unit-config /docker-entrypoint.d
COPY ./app /var/www
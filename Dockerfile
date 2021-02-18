FROM php:8.0.2-fpm-alpine3.13
ARG uid=1000
ARG user=user1
ARG password="#Secret1Password^"

SHELL ["/bin/ash", "-o", "pipefail", "-c"]
RUN apk update && \
    apk add --no-cache autoconf=2.69-r3 \
    freetype-dev=2.10.4-r1 \
    git=2.30.1-r0 \
    g++=10.2.1_pre1-r3 \
    gcc=10.2.1_pre1-r3 \
    jpeg-dev=9d-r1 \
    libpng-dev=1.6.37-r1 \
    libxml2-dev=2.9.10-r6 \
    make=4.3-r0 \
    zlib-dev=1.2.11-r3 \
    composer=2.0.9-r0 \
    postgresql-client=13.1-r2 \
    postgresql-dev=13.1-r2 && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j"$(nproc)" bcmath exif gd pcntl xml pdo_pgsql && \
    pecl install pcov redis ds && \
    docker-php-ext-enable pcov redis ds

RUN adduser -D --uid "${uid}" --home /home/"${user}" "${user}" www-data,root && \
    echo "${user}:${password}" | chpasswd

USER user1

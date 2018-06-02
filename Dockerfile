FROM php:7.2-fpm

# SOURCE CODE COPY --------------------------------------------------------------------------------------
COPY ./ /var/www/html/

# COMPOSER ----------------------------------------------------------------------------------------------
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN /usr/local/bin/composer self-update \
    && cd /var/www/html \
    && /usr/local/bin/composer install

# SET FILE PERMISSIONS -----------------------------------------------------------------------------------
RUN chown -R :www-data /var/www/html \
 && chmod -R ug+rwx /var/www/html/storage /var/www/html/bootstrap/cache
 
# Volumes ------------------------------------------------------------------------------------------------
# THESE VOLUMES are shares with nginx container using "volumes_from"
# -------------------------------------------------------------------------------------------------------
VOLUME ["/etc/nginx/conf.d/", "/var/www/html/"]
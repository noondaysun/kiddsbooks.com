FROM php:7.2-fpm

# OS UPDATES AND INSTALLS -------------------------------------------------------------------------------
RUN apt-get update
RUN apt-get install -y curl php-cli php-mbstring git unzip
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');"

# SOURCE CODE COPY --------------------------------------------------------------------------------------
COPY ./ /var/www/html/

# COMPOSER ----------------------------------------------------------------------------------------------
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN /usr/local/bin/composer self-update \
    && cd /var/www/html \
    && /usr/local/bin/composer install

# SET FILE PERMISSIONS -----------------------------------------------------------------------------------
RUN chown -R :www-data /var/www/html \
 && chmod -R ug+rwx /var/www/html/src/storage /var/www/html/src/bootstrap/cache
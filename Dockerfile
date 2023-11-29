FROM php:apache

RUN set -x \
    # Install xkcd
    apt -y install python3-pkg-resources python3 xkcdpass

COPY index.php /var/www/html/
EXPOSE 80
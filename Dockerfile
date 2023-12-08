FROM php:apache

RUN apt-get update \
    && apt-get -y install python3-pkg-resources python3 \
    #XKCD
    && apt-get -y install xkcdpass

COPY index.php /var/www/html/

EXPOSE 80
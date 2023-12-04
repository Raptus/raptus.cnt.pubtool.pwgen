FROM php:apache

#Start an enable SSH
RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog gunicorn \
    && apt-get install -y --no-install-recommends openssh-server \
    #XKCD
    && apt-get -y install python3-pkg-resources python3 xkcdpass \
    && echo "root:Docker!" | chpasswd \
    && chmod u+x ./entrypoint.sh

COPY sshd_config /etc/ssh/
COPY index.php /var/www/html/
COPY entrypoint.sh ./

EXPOSE 80 8000 2222

ENTRYPOINT [ "./entrypoint.sh" ] 

FROM php:apache

#Start an enable SSH
COPY entrypoint.sh ./
RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    #XKCD
    && apt-get -y install python3-pkg-resources python3 xkcdpass \
    && echo "root:Docker!" | chpasswd \
    && chmod u+x ./entrypoint.sh
COPY sshd_config /etc/ssh/

COPY index.php /var/www/html/

EXPOSE 80 8000 2222

ENTRYPOINT [ "./entrypoint.sh" ] 

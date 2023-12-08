FROM php:apache

#COPY entrypoint.sh ./

#Start an enable SSH
RUN apt-get update \
    && apt-get -y install python3-pkg-resources python3 \
#    && apt-get install -y --no-install-recommends dialog gunicorn3 \
#    && apt-get install -y --no-install-recommends openssh-server \
    #XKCD
    && apt-get -y install xkcdpass
#    && echo "root:Docker!" | chpasswd \
#    && chmod u+x ./entrypoint.sh

#COPY sshd_config /etc/ssh/
COPY index.php /var/www/html/

#EXPOSE 80 8000 2222
EXPOSE 80

#ENTRYPOINT [ "./entrypoint.sh" ] 

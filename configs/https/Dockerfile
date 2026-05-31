FROM ubuntu:22.04

RUN apt update && apt install -y apache2 apache2-utils

RUN mkdir /var/www/html/secure
COPY .htpasswd /etc/apache2/.htpasswd

RUN echo '<Directory "/var/www/html/secure">' >> /etc/apache2/apache2.conf \
    && echo '    AuthType Basic' >> /etc/apache2/apache2.conf \
    && echo '    AuthName "Restricted"' >> /etc/apache2/apache2.conf \
    && echo '    AuthUserFile /etc/apache2/.htpasswd' >> /etc/apache2/apache2.conf \
    && echo '    Require valid-user' >> /etc/apache2/apache2.conf \
    && echo '</Directory>' >> /etc/apache2/apache2.conf

EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]

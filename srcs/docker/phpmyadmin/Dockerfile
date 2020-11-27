# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/11/27 21:04:45 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 5000
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

RUN apk add --no-cache \
    fcgi \
    nginx \
    openssl \
    php7-cgi \
    php7-common \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fpm \
    php7-gd \
    php7-gettext \
    php7-iconv \
    php7-imap \
    php7-json \
    php7-ldap \
    php7-mbstring \
    php7-mcrypt \
    php7-mysqli \
    php7-pdo \
    php7-pdo_mysql \
    php7-posix \
    php7-session \
    php7-soap \
    php7-xml \
    php7-xmlrpc \
    supervisor \
    axel

RUN adduser -D -g 'www' www && \
    mkdir /var/run/nginx /var/run/php && \
    chown -R www:www /var/lib/nginx

# Generate ssl key and certificate.
WORKDIR /etc/nginx/ssl
RUN openssl req -new -x509 -nodes -newkey rsa:4096 -keyout server.key -out server.crt -days 1095 \
    -subj "/C=RU/L=Moscow/O=Self-signed/CN=localhost" && \
    chmod 400 server.key && \
    chmod 444 server.crt

# Install phpmyadmin.
WORKDIR /usr/share/webapps
RUN axel http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.4-all-languages.tar.gz -o phpMyAdmin-5.0.4-all-languages.tar.gz && \
    tar zxvf phpMyAdmin-5.0.4-all-languages.tar.gz && \
    rm phpMyAdmin-5.0.4-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.4-all-languages phpmyadmin && \
    chmod -R 777 /usr/share/webapps && \
    chown -R www:www /usr/share/webapps

COPY rootfs /

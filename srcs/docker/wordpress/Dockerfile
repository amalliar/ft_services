# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/11/27 16:18:43 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 5050
ENTRYPOINT ["docker-entrypoint.sh"]

RUN apk add --no-cache \
    bash \
    fcgi \
    nginx \
    openssl \
    php7-cgi \
    php7-cli \
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
    php7-phar \
    php7-posix \
    php7-session \
    php7-soap \
    php7-xml \
    php7-xmlrpc \
    supervisor \
    axel

RUN adduser -D -g 'www' www && \
    mkdir /var/run/nginx && \
    chown -R www:www /var/lib/nginx

# Install WordPress.
WORKDIR /usr/share/webapps
RUN axel https://wordpress.org/latest.tar.gz -o latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    rm latest.tar.gz && \
    chown -R www:www /usr/share/webapps

WORKDIR /usr/local/bin
RUN axel https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp && \
    chmod +x wp

# Generate ssl key and certificate.
WORKDIR /etc/nginx/ssl
RUN openssl req -new -x509 -nodes -newkey rsa:4096 -keyout server.key -out server.crt -days 1095 \
    -subj "/C=RU/L=Moscow/O=Self-signed/CN=localhost" && \
    chmod 400 server.key && \
    chmod 444 server.crt

COPY rootfs /

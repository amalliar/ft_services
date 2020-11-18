# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/11/18 11:27:31 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 5000
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

RUN apk add --no-cache nginx openssl wget
RUN adduser -D -g 'www' www && \
    mkdir /var/run/nginx && \
    chown -R www:www /var/lib/nginx

# Generate ssl key and certificate.
WORKDIR /etc/nginx/ssl
RUN openssl req -new -x509 -nodes -newkey rsa:4096 -keyout server.key -out server.crt -days 1095 \
    -subj "/C=RU/L=Moscow/O=Self-signed/CN=localhost" && \
    chmod 400 server.key && \
    chmod 444 server.crt

# Install phpmyadmin.
WORKDIR /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
    tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
    rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
    mv phpMyAdmin-5.0.2-all-languages phpmyadmin && \
    chmod -R 777 /usr/share/webapps && \
    chown -R www:www /usr/share/webapps

COPY config.inc.php /usr/share/webapps/phpmyadmin
COPY nginx.conf /etc/nginx/nginx.conf

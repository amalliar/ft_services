# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/11/23 12:51:36 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 20 21 40000
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

RUN apk add --no-cache \
    openssl \
    supervisor \
    telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    vsftpd

RUN echo "root:toor" | chpasswd && \
    mkdir /var/ftp

# Generate ssl key and certificate.
WORKDIR /etc/vsftpd/ssl
RUN openssl req -new -x509 -nodes -newkey rsa:4096 -keyout server.key -out server.crt -days 1095 \
    -subj "/C=RU/L=Moscow/O=Self-signed/CN=localhost" && \
    chmod 400 server.key && \
    chmod 444 server.crt

COPY rootfs /

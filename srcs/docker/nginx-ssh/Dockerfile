# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/11/18 06:48:38 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 22 80 443
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

RUN apk add --no-cache nginx openssl openssh supervisor
RUN adduser -D -g 'www' www
RUN mkdir /www && mkdir /var/run/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# Generate ssl key and certificate.
WORKDIR /etc/nginx/ssl
RUN openssl req -new -x509 -nodes -newkey rsa:4096 -keyout server.key -out server.crt -days 1095 \
    -subj "/C=RU/L=Moscow/O=Self-signed/CN=localhost" && \
    chmod 400 server.key && \
    chmod 444 server.crt

# Generate ssh keys.
WORKDIR /etc/ssh
RUN ssh-keygen -A && \
    sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && \
    echo "root:toor" | chpasswd
COPY www /www
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

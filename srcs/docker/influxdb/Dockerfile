# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/11/19 10:29:20 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 8086
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

RUN apk add --no-cache \
    influxdb \
    supervisor \
    telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

COPY rootfs /

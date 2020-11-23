# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/11/24 18:14:57 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 3000
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

RUN apk add --no-cache \
    libc6-compat --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main \
    supervisor \
    telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    axel

RUN axel https://dl.grafana.com/oss/release/grafana-7.3.3.linux-amd64.tar.gz -o grafana-7.3.3.linux-amd64.tar.gz && \
    tar -zxvf grafana-7.3.3.linux-amd64.tar.gz

COPY rootfs /

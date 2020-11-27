# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/11/27 16:11:18 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 3000
ENTRYPOINT ["/usr/sbin/grafana-server", "web"]

RUN apk add --no-cache \
    grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    libc6-compat --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main

COPY rootfs /

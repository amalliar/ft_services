# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/12/02 21:09:47 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 3000
ENTRYPOINT ["grafana-server", "web"]

RUN apk add --no-cache \
    grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    libc6-compat --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main

COPY rootfs /
WORKDIR /usr/share/grafana

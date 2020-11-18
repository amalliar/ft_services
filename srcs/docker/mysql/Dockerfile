# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amalliar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/02 00:17:37 by amalliar          #+#    #+#              #
#    Updated: 2020/11/18 10:19:23 by amalliar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
LABEL maintainer="amalliar@student.21-school.ru"
EXPOSE 3306
ENTRYPOINT ["/etc/init.d/mariadb start"]

RUN adduser -D -g 'mysql' mysql
RUN apk add --no-cache mysql mysql-client
RUN chown -R mysql:mysql /var/lib/mysql
COPY mysql-setup.sh /root
RUN /etc/init.d/mariadb setup && \
    /root/mysql-setup.sh

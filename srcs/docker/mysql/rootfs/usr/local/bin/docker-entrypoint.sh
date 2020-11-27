#!/bin/sh

mysql_install_db --user=mysql --ldata=/var/lib/mysql
/usr/bin/mysqld --console --init_file=/etc/mysql/config.sql

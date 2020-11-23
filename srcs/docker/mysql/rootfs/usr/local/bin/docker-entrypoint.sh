#!/bin/sh

# Import existing databases.
mysql_install_db --user=mysql --ldata=/var/lib/mysql

# Start supervisor daemon.
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

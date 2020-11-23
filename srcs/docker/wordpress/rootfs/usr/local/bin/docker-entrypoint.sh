#!/bin/bash

WP="wp --allow-root"
WP_ROOT=/usr/share/webapps/wordpress
cd $WP_ROOT

while [[ -n $($WP core is-installed 2>&1 | grep Error) ]]
do
    echo "Waiting for mysql database to start up..."
    sleep 15s
done

if ! $($WP core is-installed);
then
    $WP core install --url=wordpress/ --path=$WP_ROOT --title="WHATEVER" --admin_user="root" --admin_password="toor" --admin_email=admin@foobar.com --skip-email
    $WP user create editor editor@foobar.com --role=editor --user_pass=editor
    $WP user create author author@foobar.com --role=author --user_pass=author
    $WP user create contributor contributor@foobar.com --role=contributor --user_pass=contributor
    $WP user create subscriber subscriber@foobar.com --role=subscriber --user_pass=subscriber
fi

# Start supervisor daemon.
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

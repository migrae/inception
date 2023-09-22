#!/bin/sh
wp-cli config create --allow-root --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=$WP_DB_HOST
while ! wp-cli core install --title=$WP_TITLE \
        --url=$WP_HOST --admin_user=$WP_ADMIN \
        --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL
do
  sleep 1
	echo "...Waiting for mariadb..."
done
wp-cli user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS
php-fpm81 -F
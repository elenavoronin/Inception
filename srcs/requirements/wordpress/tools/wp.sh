#!/bin/bash


echo "Starting Wordpress setup..."

# check for any config files
if [ ! -f /var/www/html/wp-config.php ];
    then
    sleep 5
    wp core download --allow-root
    wp config create --path=/var/www/html --dbhost="${WORDPRESS_DB_HOST}":3306 --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --allow-root
    wp core install --path=/var/www/html --url="${DOMAIN_NAME}" \
    --title="My WordPress Site" --admin_user="${WORDPRESS_DB_ADMIN}" \
    --admin_password="${WORDPRESS_DB_ADMIN_PASSWORD}" \
    --admin_email="${WORDPRESS_DB_ADMIN_EMAIL}" --allow-root
    wp user create "${WORDPRESS_DB_USER}" "${WORDPRESS_DB_USER_EMAIL}" --user_pass="${WORDPRESS_DB_PASSWORD}" --role=editor --path=/var/www/html --allow-root
fi

# Keep the service running in the background
/usr/sbin/php-fpm7.4 -F




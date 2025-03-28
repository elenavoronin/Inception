#!/bin/bash

# Exit on error
set -e

# load .env variables
set -o allexport
source /docker-entrypoint-initdb.d/.env
set +o allexport

echo "Starting Wordpress setup..."

# check for any config files
if [ ! -f /var/www/html/wp-config.php ] &&
    [ ! -f /var/www/html/index.php ];
    then
    mysqladmin -u root -p"${MYSQL_ROOT_PASSWORD}" create wordpress

    wp config create --path=/var/www/html --dbname=wordpress --dbuser=root --dbpass="${MYSQL_ROOT_PASSWORD}"

    wp core install --path=/var/www/html --url="http://localhost" --
    title="My WordPress Site" --admin_user="${WORDPRESS_DB_ADMIN}" --admin_password="${WORDPRESS_DB_ADMIN_PASSWORD}" --
    admin_email="${WORDPRESS_DB_ADMIN_EMAIL}"

    wp user create "${WORDPRESS_DB_USER}" "${WORDPRESS_DB_USER_EMAIL}" --role=editor --path=/var/www/html
fi

# Keep the service running in the background
/usr/sbin/php-fpm8.2 -F




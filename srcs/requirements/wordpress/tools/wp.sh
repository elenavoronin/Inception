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
    mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} create wordpress

    wp config create --path=/var/www/html --dbname=wordpress --dbuser=root --dbpass="$MYSQL_ROOT_PASSWORD"

    wp core install --path=/var/www/html --url="http://localhost" --title="My WordPress Site" --admin_user=admin --admin_password=changeme --admin_email=admin@example.com






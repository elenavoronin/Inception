#!/bin/bash

# Exit on error
set -e

# load .env variables
set -o allexport
source /docker-entrypoint-initdb.d/.env
set +o allexport

echo "Starting MariaDB setup..."


service mysql start

# Initialize database if not already initialized
if [ ! -f "/var/lib/mysql/ibdata1" ]; then
    echo "Initializing database..." 
    mysqld --initialize-insecure --user=mysql
    sleep 5
    mysqld_safe --skip-networking

fi

# Run any custom SQL setup scripts
if [ -f "/docker-entrypoint-initdb.d/setup.sql" ]; then
    echo "Running setup.sql..."
    mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" < /docker-entrypoint-initdb.d/setup.sql
    mysqladmin -uroot shutdown
fi


# Start MariaDB in the background
exec mysqld_safe
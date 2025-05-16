#!/bin/bash

echo "Starting MariaDB setup..."


service mariadb start

# Initialize database if not already initialized
if [ ! -f "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "Initializing database..." 
    sleep 2
    envsubst < /docker-entrypoint-initdb.d/setup.sql > /docker-entrypoint-initdb.d/setup.sql.temp
    mv /docker-entrypoint-initdb.d/setup.sql.temp /docker-entrypoint-initdb.d/setup.sql
    mysql < /docker-entrypoint-initdb.d/setup.sql

fi


service mariadb stop

# Start MariaDB in the background
exec mysqld_safe    
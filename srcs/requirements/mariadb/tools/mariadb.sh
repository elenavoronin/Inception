#!/bin/bash
scripts

echo "Starting MariaDB setup..."


service mariadb start

# Initialize database if not already initialized
if [ ! -f "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "Initializing database..." 
    sleep 2
    mysql < /docker-entrypoint-initdb.d/setup.sql

fi


service mariadb stop

# Start MariaDB in the background
exec mysqld_safe    
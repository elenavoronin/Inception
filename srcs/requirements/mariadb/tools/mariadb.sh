#!/bin/bash

# Exit on error
set -e

start mariadb

# Initialize database if not already initialized
if [ ! -d "/var/lib/mysql/" ]; then
    echo "Initializing database..." 
    mysqld --initialize-insecure
fi

# Run any custom SQL setup scripts
if [ -f "/docker-entrypoint-initdb.d/setup.sql" ]; then
    echo "Running setup.sql..."
    mysqld --init-file=/docker-entrypoint-initdb.d/setup.sql &
    sleep 10
fi


close mariadb

exec mysqld
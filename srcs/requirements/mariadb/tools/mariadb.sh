#!/bin/bash

# Exit on error
set -e

# Manually create the MySQL data directory if it doesn't exist with the right permissions
mkdir -p /home/evoronin/data
chown -R 999:999 /home/evoronin/data  # Ensuring MySQL has the right permissions


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



exec mysqld
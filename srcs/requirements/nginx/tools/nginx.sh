#!/bin/bash

echo "Starting NGINX setup..."

echo "Creating a self-signed SSL certificate..."
openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -newkey rsa:2048 \
    -subj "/C=NL/ST=Holland/L=Amsterdam/O=Codam/CN=evoronin.42.fr" \
    -out "/etc/nginx/ssl/selfsigned.crt" \
    -keyout "/etc/nginx/ssl/selfsigned.key"

exec nginx -g "daemon off;";

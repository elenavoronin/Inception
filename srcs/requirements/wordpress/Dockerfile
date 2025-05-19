FROM debian:bullseye

# Install required packages

RUN apt-get update --allow-releaseinfo-change || { echo "apt-get update failed"; exit 1; }

RUN apt-get install -y curl php php-fpm php-mysql mariadb-client;


# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the WordPress initialization script
COPY ./tools/wp.sh /usr/local/bin/
COPY ./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod +x /usr/local/bin/wp.sh
RUN mkdir -p /run/php/


# Set the working directory
WORKDIR /var/www/html

# Expose the necessary port
EXPOSE 9000

# Run the initialization script
CMD ["/usr/local/bin/wp.sh"]
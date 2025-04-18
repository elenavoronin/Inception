FROM php:8.2-fpm

# Install required packages

RUN apt-get update --allow-releaseinfo-change || { echo "apt-get update failed"; exit 1; }

RUN apt-get install -y \
        git \
        curl \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        libzip-dev \
        zip \
        unzip \
        default-mysql-client \
        gnupg2 \
        ca-certificates \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql gd xml zip


RUN apt-key adv --fetch-keys https://ftp-master.debian.org/keys/archive-key-11.asc
RUN apt-key adv --fetch-keys https://ftp-master.debian.org/keys/archive-key-11-security.asc
    

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Copy the WordPress initialization script
COPY ./tools/wp.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp.sh

# Set the working directory
WORKDIR /var/www/html

# Expose the necessary port
EXPOSE 9000

# Run the initialization script
CMD ["/usr/local/bin/wp.sh"]
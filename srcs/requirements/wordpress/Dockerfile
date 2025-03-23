FROM php-fpm

# Install required packages
RUN apt-get update && apt-get instal -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    mysql-client \
    && docker-php-ext-install -j$(nproc) iconv mbstring mysqli pdo_mysql gd xml zip

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
&   & mv wp-cli.phar /usr/local/bin/wp

# Copy the WordPress initialization script
COPY ./tools/wp.sh /user/local/bin/
RUN chmod +x /usr/local/bin/wp.sh

# Set the working directory
WORKDIR /var/www/html

# Expose the necessary port
EXPOSE 9000

# Run the initialization script
CMD ["/usr/local/bin/wp.sh"]
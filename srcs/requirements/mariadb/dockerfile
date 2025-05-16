# Use Debian as the base image
FROM debian:bullseye

# Install MariaDB server
RUN apt-get update && apt-get install -y mariadb-server mariadb-client gettext \
    && rm -rf /var/lib/apt/lists/* 

# Ensure MariaDB runs correctly with the right data directory
RUN mkdir -p /usr/local/bin/ \
&& chown -R mysql:mysql /usr/local/bin/

RUN mkdir -p /var/lib/mysql \
    && chown -R mysql:mysql /var/lib/mysql

# Copy custom configuration file and setup script
COPY ./tools/mariadb.sh /usr/local/bin/
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
COPY ./tools/setup.sql /docker-entrypoint-initdb.d/
RUN  chmod +x /usr/local/bin/mariadb.sh


EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

# Start MariaDB
CMD ["mysqld"]

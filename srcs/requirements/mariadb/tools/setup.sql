-- this is an SQL script 

CREATE DATABASE IF NOT EXISTS '${MYSQL_DATABASE}';

-- Create the user if it doesn’t already exist
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';

-- Grant all privileges on the database to the user

GRANT ALL PRIVILEGES ON '${MYSQL_DATABASE}'.* TO '${MYSQL_USER}'@'%';

-- Ensure privileges take effect immediately

FLUSH PRIVILEGES;

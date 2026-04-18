#!/bin/bash

DB_HOST="database-1.c36g22me8x2x.us-east-2.rds.amazonaws.com"
DB_PORT="3306"
DB_NAME="database-1"
DB_USER="admin"
DB_PASS="admin1234"

echo "Creating DB Configuration for WAR..."

cat <<EOF > db-configuration properties
spring.datasource.url=jdbc:mysql://$DB_HOST:$DB_PORT/$DB_NAME
spring.datasource.username=$DB_USER
spring.datasource.password=$DB_PASS
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
EOF

echo "DB configuration file created: db-config.properties"

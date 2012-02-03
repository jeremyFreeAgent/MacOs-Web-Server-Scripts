#!/bin/bash

# Configuration
MYSQL="/usr/local/bin/mysql"
MYSQL_USER="root"
MYSQL_PASSWORD="root"
MYSQL_PASSWORD_FOR_DATABASE="chucknorris"
MYSQLADMIN="/usr/local/bin/mysqladmin"

if [ -z "$1" ] ; then
  echo "Usage: $0 database_name"
  exit 1
fi

# Create the local URL

echo "Creating the database : $1"
$MYSQLADMIN -u $MYSQL_USER -p$MYSQL_PASSWORD create $1

echo "Creating the database user : $1"
$MYSQL -u root -proot -e "CREATE USER '$1'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD_FOR_DATABASE'"
$MYSQL -u root -proot -e "GRANT ALL ON $1.* TO '$1'@'localhost'"

echo "Database created !"

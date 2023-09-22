#!/bin/sh
DB_DIR=/tmp/create_db.sql

echo "CREATE DATABASE $DB_NAME;"                                > $DB_DIR
echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"     >> $DB_DIR
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"    >> $DB_DIR
echo "FLUSH PRIVILEGES;"                                        >> $DB_DIR
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"  >> $DB_DIR

rc-service mariadb start;
mariadb -u root -p"$DB_ROOT_PASS" < $DB_DIR;
mysqladmin -u root -p"$DB_ROOT_PASS" shutdown;
mariadbd -u root;
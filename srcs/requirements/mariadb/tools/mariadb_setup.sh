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

# DB_DIR=/tmp/create_db.sql

# # Start MariaDB Service
# rc-service mariadb start

# # Check if the database exists
# db_exists=$(mysql -u root -p"$DB_ROOT_PASS" -e "SHOW DATABASES LIKE '$DB_NAME';" | grep "$DB_NAME" > /dev/null; echo "$?")
# if [ $db_exists -eq 0 ]; then
#     echo "Database $DB_NAME already exists."
# else
#     echo "CREATE DATABASE $DB_NAME;" > $DB_DIR
# fi

# # Check if the user exists
# user_exists=$(mysql -u root -p"$DB_ROOT_PASS" -e "SELECT User FROM mysql.user WHERE User='$DB_USER';" | grep "$DB_USER" > /dev/null; echo "$?")
# if [ $user_exists -eq 0 ]; then
#     echo "User $DB_USER already exists."
# else
#     echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" >> $DB_DIR
#     echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> $DB_DIR
# fi

# # Additional Commands
# echo "FLUSH PRIVILEGES;" >> $DB_DIR
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';" >> $DB_DIR

# # Execute the SQL commands
# if [ $db_exists -ne 0 ] || [ $user_exists -ne 0 ]; then
#     mariadb -u root -p"$DB_ROOT_PASS" < $DB_DIR
# fi

# # Shutdown and Restart MariaDB in the foreground
# mysqladmin -u root -p"$DB_ROOT_PASS" shutdown
# mariadbd -u root

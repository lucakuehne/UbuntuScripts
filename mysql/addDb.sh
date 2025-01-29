# Ask for mysql root password
read -p 'Please enter the root password for mysql: ' mysql_root_pw

# Define the name for the new db and corresponding user
read -p 'Please define the name for the new DB and corresponding user: ' new_db

# Create database
sudo mysql --user=root --password=$mysql_root_pw --execute="CREATE DATABASE $new_db;"

# Ask for password for new db user
read -p 'Please define the password for the new DB and corresponding user: ' new_db_pw

# Create user
sudo mysql --user=root --password=$mysql_root_pw --execute="CREATE USER '$new_db'@'%' IDENTIFIED BY '$new_db_pw';"

# Grant all access for user to db
sudo mysql --user=root --password=$mysql_root_pw --execute="GRANT ALL ON $new_db.* TO '$new_db'@'%';"

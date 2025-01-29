# Update the local package index
sudo apt update

# Install mysql
sudo apt -y install mysql-server

# Allow authentication of root in mysql by password. This is to prevent errors in the mysql_secure_installation script starting from 2022 on
# Ask for password and save it to variable
while true; do
  read -p 'Please define a password for the root mysql login: ' mysql_root_password
  read -p 'Please repeat the password for the root mysql login: ' mysql_root_password_confirm
  if [[ "$mysql_root_password" == "$mysql_root_password_confirm" ]]; then
    break
  fi
  echo 'The entered passwords do not match. Please try again.'
done
echo $mysql_root_password

# Set password
sudo mysql --execute="ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$mysql_root_password';"

# Run the mysql_secure_installation script
sudo mysql_secure_installation

# Install php and the php-plugin for mysql
sudo apt -y install php php-mysql

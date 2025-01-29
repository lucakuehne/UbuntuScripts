# Update the local package index
sudo apt update

# Install Apache
sudo apt -y install apache2

# Allow Apache in firewall
sudo ufw allow in "Apache"

# TODO: Show link to test access to Apache2
ip_address=$(hostname -I | awk '{print $1}')
printf 'Check if access to apache works via \e]8;;http://$ip_address/\e\\http://$ip_address/\e]8;;\e\\\n'

# Check if Apache ist running with the following command
# sudo systemctl status apache2

# Install php and the php-plugin for apache
sudo apt -y install php libapache2-mod-php

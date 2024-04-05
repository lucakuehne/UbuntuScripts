# Update the local package index
sudo apt update

# Install Apache
sudo apt install apache2

# Check if Apache ist running
sudo systemctl status apache2

# TODO: Show link to test access to Apache2
printf 'Check if access to apache works via \e]8;;http://IP/\e\\http://IP/\e]8;;\e\\\n'

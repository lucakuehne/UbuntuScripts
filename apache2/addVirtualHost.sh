# Define a new vhost
read -p 'Please define the (main, without alias like www) address for the new vhost: ' new_vhost

# Create a directory for the virtual host
sudo mkdir /var/www/$new_vhost

# Assign ownership of created web root to current user
sudo chown -R $USER:$USER /var/www/$new_vhost

# Add lines to tmp configuration
echo "<VirtualHost *:80>" >> $new_vhost.conf
echo "  ServerName $new_vhost" >> $new_vhost.conf
echo "  ServerAlias www.$new_vhost" >> $new_vhost.conf
echo "  DocumentRoot /var/www/$new_vhost" >> $new_vhost.conf
echo "  ErrorLog ${APACHE_LOG_DIR}/error.log" >> $new_vhost.conf
echo "  CustomLog ${APACHE_LOG_DIR}/access.log combined" >> $new_vhost.conf
echo "</VirtualHost>" >> $new_vhost.conf

# Move tmp configuration to apache's sites-available
sudo mv $new_vhost.conf /etc/apache2/sites-available/$new_vhost.conf

# Activate apache site
sudo a2ensite $new_vhost

# Deactivate apache default site if not allready deactivated
sudo a2dissite 000-default

# Test apache configuration
sudo apache2ctl configtest

# Reload apache service
sudo systemctl reload apache2

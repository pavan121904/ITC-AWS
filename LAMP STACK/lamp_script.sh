#!/bin/bash
# Update packages and install Apache, PHP, and MySQL
apt-get update -y && apt-get upgrade -y && apt-get install apache2 php libapache2-mod-php mysql-server php-mysql -y 
# Enable Apache rewrite module and restart Apache service
a2enmod rewrite && service apache2 restart 
# Create a test web page 
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
# Allow port 22, 80, and 443 using ufw
ufw allow ssh
ufw allow htt
ufw allow https
ufw enable

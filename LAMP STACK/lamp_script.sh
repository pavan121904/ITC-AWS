#!/bin/bash

# Update the system
sudo yum update -y

# Install Apache, MySQL, PHP
sudo yum install -y httpd mariadb-server php php-mysql

# Start and enable Apache and MySQL
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Secure MySQL/MariaDB installation
sudo mysql_secure_installation <<EOF

y
your_mysql_root_password
your_mysql_root_password
y
y
y
y
EOF

# Create a test PHP file
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

# Open necessary ports in the security group (e.g., 80 for HTTP)
# Replace sg-XXXXXXXXX with your security group ID
# aws ec2 authorize-security-group-ingress --group-id sg-XXXXXXXXX --protocol tcp --port 80 --cidr 0.0.0.0/0

# Restart Apache to apply changes
sudo systemctl restart httpd

# Provide instructions for further configuration and testing
echo "LAMP stack installation is complete."
echo "You can access the PHP info page at http://your-instance-ip/info.php"
echo "Don't forget to open port 80 (HTTP) in your AWS security group settings."

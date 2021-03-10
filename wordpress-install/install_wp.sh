#!/bin/sh
echo
echo "This script assumes you are running a flavor of linux with apt package manager."
echo
echo "This script will install the necessary LAMP stack components to host your very own WordPress site :)"
sleep 3
echo
echo "First make sure that all packages are updated..."
sleep 3
sudo apt update && sudo apt upgrade && sudo apt dist-upgrade -y
echo
echo "Very nice...now we install the necessary LAMP (Linux, Apache, MySQL/MariaDB, PHP/Perl) components..."
sleep 3
sudo apt install apache2 mysql-common mariadb-server php7.4 tar
echo
echo "Now we download and install WordPress..."
sleep 3
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz --no-check-certificate
echo
echo "Unzipping wordpress into a folder on the web root"
sleep 3
sudo tar -xzvf latest.tar.gz
echo
echo "Downloaded and installed WordPress..."
sleep 3
echo
echo "Creating WP database and DB User..."
sleep 3
echo
echo "If you don't have a root password for your MySQL instance, just press Enter:"
sudo mysql -u root -p < $HOME/LinuxScripts/wordpress-install/wp_mysql_setup.sql
echo
echo "Replacing the wp-config.php file to match the default MySQL setup..."
sleep 3
sudo cp -r $HOME/LinuxScripts/wordpress-install/wp-config.php /var/www/html/wordpress/
sudo rm -rf /wordpress/wp-config-sample.php
echo
echo "Now visit http://serverIPaddress/wordpress/wp-admin/install.php"

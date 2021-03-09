#!/bin/sh
echo
echo "This script assumes you are running a flavor of linux with apt package manager."
echo
echo "This script will install the necessary LAMP stack components to host your very own WordPress site :)"
sleep 5
echo
echo "First make sure that all packages are updated..."
sudo apt update && sudo apt upgrade && sudo apt dist-upgrade -y
echo
echo "Very nice...now we install the necessary LAMP (Linux, Apache, MySQL/MariaDB, PHP/Perl) components..."
sleep 3
echo
sudo apt install apache2 mysql-common mariadb-server php7.4 tar
echo
echo "Now we download and install WordPress..."
sleep 3
echo
sudo wget https://wordpress.org/latest.tar.gz
echo
echo "Unzipping wordpress into a folder on the web root"
sleep 3
sudo tar -xzvf latest.tar.gz
echo
echo "Downloaded and installed WordPress..."
echo
echo "Creating WP database and DB User..."
echo
echo "If you don't have a root password for your MySQL instance, just press Enter:"
sudo mysql -u root -p < wp_mysql_setup.sql

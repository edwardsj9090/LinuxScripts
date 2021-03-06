#!/bin/sh

echo "This will install the LAMP (Linux, Apache, MySQL/MariaDB, PHP/Perl) stack along with the firefly-iii financial manager app..."
echo
echo "This script assumes 3 things:"
echo "1. You are running apache so the apache2 service directory is /etc/apache2/"
echo "2. Your web root directory is /var/www/html/"
echo "3. You have a root password for your mysql instance"
sleep 10
echo
echo "First start by making sure that all of the packages are up to date..."
echo
sudo apt update && sudo apt upgrade -y
echo
echo "Very nice...now we install the necessary web server components..."
sleep 3
echo
sudo apt install apache2 mysql-common mariadb-server php7.4 php7.4-bcmath php7.4-intl php7.4-curl php7.4-zip php7.4-gd php7.4-xml php7.4-mbstring php7.4-ldap php7.4-mysql php-mysql -y
echo
echo "Now to install Composer (a friendly php helper that unpacks the php libraries contained within firefly and creates a firefly-ii directory with the project unpacked..."
echo
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
echo
cd /var/www/html
echo
echo "If prompted, just hit Enter"
echo
sudo composer create-project grumpydictator/firefly-iii --no-dev --prefer-dist firefly-iii 5.4.6
echo
echo "Change firefly-iii directory permissions"
echo
# This will stop the  white screen issue
sudo chown -R www-data:www-data firefly-iii
sudo chmod -R 775 firefly-iii/storage
echo
echo "Creating firefly database and user..."
echo
echo "Enter your MySQL root password.  If you don't have one, just hit Enter."
sudo mysql -u root -p < $HOME/LinuxScripts/mysql_setup.txt
echo
echo "Replacing .env file in /var/www/html directory..."
echo
sudo cp $HOME/LinuxScripts/.env /var/www/html/firefly-iii/
echo
echo "Copying .htaccess file to /var/www/html/firefly-iii/ directory..."
echo
sudo cp $HOME/LinuxScripts/.htaccess /var/www/html/firefly-iii/
echo
cd /var/www/html/firefly-iii
echo
echo "Artisan setup..."
echo
sudo php artisan migrate:refresh --seed
sudo php artisan firefly-iii:upgrade-database
sudo php artisan passport:install
echo
sudo service apache2 restart
echo
echo "All done..."
echo
echo "Post Install Steps:"
echo
echo "Make sure that the following lines are in the /etc/apache2/apache2.conf file"
echo "This will protect the root of the firefly-iii folder from prying eyes :)"
echo
echo "<Directory /var/www/>"
echo     "Options Indexes FollowSymLinks"
echo     "AllowOverride All"
echo     "Require all granted"
echo "</Directory>"
echo
echo
echo "<Directory /var/www/html/firefly-iii>"
echo     "Require all denied"
echo "</Directory>"
echo
echo
echo "<Directory /var/www/html/firefly-iii/public>"
echo     "Require all granted"
echo "</Directory>"
echo
echo

#/bin/sh
echo "This script assumes that you are running a flavor of Linux with the APT package manager"
sleep 3
echo
echo "This will update your packages and your distribution's headers..."
echo
sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt upgrade-linux-headers-$(uname -r) -y
echo
echo "Installing uncomplicated firewall..."
echo
sudo apt install ufw
echo
echo "Installing BleachBit"
echo
sudo apt install bleachbit
echo
echo "System updates and firewall protection have been installed.  Have fun :)"

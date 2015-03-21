#!/bin/bash

#This is an update script for any flavor of Linux running the apptitude package manager.

#Downloads updates from the repository sources for your Linux distribution and installs them
sudo apt-get update && sudo apt-get upgrade -y

#Downloads and installs any updates to the OS
sudo apt-get dist-upgrade -y

#Updates Linux headers
sudo apt-get update && sudo apt-get install -y linux-headers-$(uname -r)

#Uncomment the 'reboot' line below to have the computer reboot after installing updates
#reboot

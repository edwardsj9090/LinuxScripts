# LinuxScripts
Scripts for Linux upgrades and various Linux tasks.

DO NOT run the .sh as sudo or root.  The $HOME system variable will redirect to the /root/ user home directory, and the lines in the script that reference the $HOME variable will not run properly because the files are stored in your user's home folder.

These scripts assume you are running a flavor of Linux that includes apt package manager.

================================

To run the scripts you have to make them executable once you download them because some Linux distros by default do not allow .sh files to execute.

Here is how to make the .sh files executable:

1. You can right click the file and go to the 'Permissions' tab and tick the checkbox that says "Allow executing file as program".

OR

2. Use the following terminal command to make the file executable:

chmod +x /path/to/your/filename.sh

Thank you JC5 for this awesome firefly-iii financial management app :)

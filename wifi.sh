#! /bin/bash 
# ----------------------- DESCRIPTIVE INFORMATION ---------------------------------
#
# Full Title: wifi.sh
#
# Created By: Javier Faustino
# Original Date: 04-02-2016
# Modified Date: 06-03-2016
# Description: Code to enable wifi settings for CentOS Laptops
# 
# ----------------------- DESCRIPTIVE INFORMATION ---------------------------------
#
#
# ------------------------------ INSTRUCTIONS -------------------------------------

# Checks if rpm is installed if not then it installs the rpm command
#program="rpm"
#condition=$(which $program 2>/dev/null | grep -v "not found" wc -1)
#if [ $condition -eq 0 ]
#then
#    sudo yum install rpm -y
#else
#    echo "The software rpm is install on this computer. Skipping to the set up."
#fi

# Checks if wifi rpm is installed on client's desktop
#if [ ! -f /home/$USER/Desktop/NetworkManager-wifi-*.rpm ]
#then
#    echo "CentOS Wifi rpm hasn't been installed. Installing ..."
#    wget ftp://mirror.switch.ch/pool/4/mirror/scientificlinux/7.2/x86_64/os/Packages/NetworkManager-wifi-1.0.6-27.el7.x86_64.rpm -P /home/$USER/Desktop/NetworkManager-wifi-1.0.6-27.el7.x86_64.rpm
#    sleep 2
#    echo "DONE: rpm file has been downloaded."
#fi

# Installs the rpm downloaded
#echo "Proceed with the installation Y or N." 
#read reply
#if [ "$reply" == "Y" ] | [ "$reply" == "y" ] | [ "$reply" == "yes" ] | [ "$reply" == "Yes" ]
#then
#    if [ -f /home/$USER/Desktop/NetworkManager-wifi-1.0.6-27.el7.x86_64.rpm ]
#    then 
#	echo " "
#	echo "Installing rpm ... "
#	echo " "
#	rpm -ivh /home/$USER/Desktop/NetworkManager-wifi-1.0.6-27.el7.x86_64.rpm
#	sleep 2
#	echo "DONE: Finished installing the wifi rpm."
 #   else
#	echo "Skipping installation"
 #   fi
#fi
while true {
do
# Brings down the network
echo "Bringing down your networking"
ifconfig lo up
ifconfig lo down

# Commands to start the wifi NeetworkManager
if [ 'service NetworkManager status | grep inactive' ] | [ 'service NetworkManager status | grep dead' ]
then
    chkconfig network off
    sleep 2
    chkconfig NetworkManager off
    sleep 2
    chkconfig network on
    sleep 2
    chkconfig NetworkManager on
    sleep 2
    service network stop
    sleep 2
    service NetworkManager stop
    sleep 2
    service network start
    sleep 2
    service NetworkManager start
    echo " Bring your network back up"
    ifconfig lo up
    sleep 2
    echo " DONE: lo interface back up"
else
    echo " "
fi
done
}

#!/bin/sh

export EAP_HOME="/opt/rh/eap7/root/usr/share/wildfly"


EAP_USER=$1
EAP_PASSWORD=$2

echo "Configuring EAP managment user" >> $HOME/install.progress.txt
$EAP_HOME/bin/add-user.sh -u $EAP_USER -p $EAP_PASSWORD -g 'guest,mgmtgroup'

echo "Start EAP 7.2" >> $HOME/install.progress.txt
systemctl restart eap7-standalone.service 

# Seeing a race condition timing error so sleep to deplay
sleep 20

echo "ALL DONE!" >> $HOME/install.progress.txt
/bin/date +%H:%M:%S >> $HOME/install.progress.txt

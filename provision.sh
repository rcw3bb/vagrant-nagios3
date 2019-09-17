#!/bin/bash

#----------- Setup Nagios -----------#
echo "Setting up nagios3"

cd /etc/nagios3
rm -fR conf.d
ln -s /vagrant/nagios/conf.d conf.d
rm nagios.cfg
ln -s /vagrant/nagios/nagios.cfg nagios.cfg
rm htpasswd.users
cp /vagrant/nagios/htpasswd.users .
chown root:root htpasswd.users
chmod 644 htpasswd.users

#----------- Setup Nagios NRDP -----------#
echo "Setting up nrdp"

mkdir -p /vagrant/nrdp/logs

cd /usr/local/nrdp/server
rm config.inc.php
cp /vagrant/nrdp/server/config.inc.php .
chown nagios:nagios config.inc.php
chmod 644 config.inc.php

service apache2 restart
service nagios3 restart

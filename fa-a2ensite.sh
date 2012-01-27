#!/bin/bash

# Configuration
APACHE="/usr/local/FreeAgent/apache2/bin/apachectl"
APACHE_SITES_AVAILABLE="/usr/local/FreeAgent/apache2/sites-available"
APACHE_SITES_ENABLED="/usr/local/FreeAgent/apache2/sites-enabled"

if [ -z "$1" ] ; then
  echo "Usage: $0 vhost_name"
  exit 1
fi

# Enable the vhost
echo "Enabling the vhost"
sudo ln -s "$APACHE_SITES_AVAILABLE/$1" "$APACHE_SITES_ENABLED/$1"

# Reload Apache2
echo "Retarting Apache"
sudo $APACHE restart

echo "Vhost enabled !"

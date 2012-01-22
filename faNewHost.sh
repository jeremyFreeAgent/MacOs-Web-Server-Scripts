#!/bin/bash


# Configuration
PHP="/usr/bin/php"
APACHE="/usr/local/FreeAgent/apache2/bin/apachectl"
APACHE_SITES_AVAILABLE="/usr/local/FreeAgent/apache2/sites-available"
APACHE_SITES_ENABLED="/usr/local/FreeAgent/apache2/sites-enabled"

if [ -z "$1" ] ; then
  echo "Usage: $0 vhost_name"
  exit 1
fi

# Create the local URL
URL_PROJECT=`echo "$1.local" | tr '[[:upper:]]' '[[:lower:]]'`
echo "Creating the local URL: $URL_PROJECT"

# vhost config
echo "Adding the vhost in $APACHE_SITES_AVAILABLE/$1"
sudo echo "
<VirtualHost *:80>
    ServerName $URL_PROJECT

    DocumentRoot \"`pwd`/web\"
    DirectoryIndex index.php

    <Directory \"`pwd`\">
        AllowOverride All
        Allow from all
    </Directory>
</VirtualHost>
" > "$APACHE_SITES_AVAILABLE/$1"

# Add url local in /etc/hosts
echo "Adding the local URL in /etc/hosts"
sudo echo "127.0.0.1       $URL_PROJECT" >> /etc/hosts

# Enable the vhost
echo "Enabling the vhost"
#sudo a2ensite $1
sudo ln -s "$APACHE_SITES_AVAILABLE/$1" "$APACHE_SITES_ENABLED/$1"

# Reload Apache2
echo "Retarting Apache"
sudo $APACHE restart

echo "Done !"

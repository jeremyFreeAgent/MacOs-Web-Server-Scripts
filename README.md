MacOs Web Server Scripts
========================

My scripts for time saving !

Install Scripts
---------------

Run the install command to install scripts to /usr/bin

    install-bin.sh

Enable vhost fa-a2ensite
------------------------

### What it does

It does the same thing than the debian a2ensite script.

### Usage

Run the command with a host name

    fa-a2ensite chuck-norris

Disable vhost fa-a2dissite
--------------------------

### What it does

It does the same thing than the debian a2dissite script.

### Usage

Run the command with a host name

    fa-a2dissite chuck-norris

New host fa-newhost
---------------------

### What it does

It's create for a project the Apache2 vhost configuration, activate the vhost, add the host entry in /etc/hosts, restart Apache2.

### What you need

In your Apache2 httpd.conf file :

    NameVirtualHost *:80
    Include sites-enabled/*

### Usage

Run the command in your project folder and choose a host name :

    fa-newhost chuck-norris

### Sources

Based on http://www.willdurand.fr/creation-automatique-dun-projet-symfony-mysql-git-et-apache2/

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_markup`)
3. Commit your changes (`git commit -am "Added Snarkdown"`)
4. Push to the branch (`git push origin my_markup`)
5. Create an [Issue][1] with a link to your branch
6. Enjoy a refreshing Diet Coke and wait

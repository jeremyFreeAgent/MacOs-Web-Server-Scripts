#!/bin/bash

echo "Creating symlinks to /usr/bin/"

sudo ln -s `pwd`/fa-newhost.sh /usr/bin/fa-newhost
sudo ln -s `pwd`/fa-a2ensite.sh /usr/bin/fa-a2ensite
sudo ln -s `pwd`/fa-a2dissite.sh /usr/bin/fa-a2dissite

echo "Please reload your bash !"

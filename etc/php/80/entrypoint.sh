#!/bin/sh
echo ' START PHP POST INSTALL SCRIPTS'

setfacl -dm u:www-data:rwX /var/www

echo ' END PHP POST INSTALL SCRIPTS'

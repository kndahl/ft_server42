#!/bin/sh

if grep -q "autoindex off;" /etc/nginx/sites-available/default
then sed -i 's/autoindex off;/autoindex on;/' /etc/nginx/sites-available/default; echo "Autoindex ON"
else
sed -i 's/autoindex on;/autoindex off;/' /etc/nginx/sites-available/default; echo "Autoindex OFF"
fi
nginx -s reload

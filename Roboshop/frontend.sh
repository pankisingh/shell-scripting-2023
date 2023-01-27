#!/usr/bin/bash

echo -e "Installing Nginx\t\t...\t\e[32mdone\e[m"
yum install nginx -y

echo Enabling Nginx.
systemctl enable nginx

echo Starting Nginx.
systemctl start nginx
#!/usr/bin/bash

yum install nginx -y
systemctl enable nginx
systemctl start nginx
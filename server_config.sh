#!/bin/bash
yum update -y
yum install -y httpd
echo 'Hello Everyone' > /var/www/html/index.html
service httpd start

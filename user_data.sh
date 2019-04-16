#!/bin/bash
yum update -y
yum install -y httpd
echo 'Hello Xylem' > /var/www/html/index.html
service httpd start





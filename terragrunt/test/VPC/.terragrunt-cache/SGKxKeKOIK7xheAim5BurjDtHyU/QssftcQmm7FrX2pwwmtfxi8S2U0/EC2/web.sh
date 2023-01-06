#!/bin/bash
yum -y install httpd
chkconfig httpd on
set +H
echo "<h1>Hello World!</h1>" > /var/www/html/index.html
service httpd start
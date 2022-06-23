#!/bin/bash
yum install wget unzip httpd -y
systemctl start httpd
systemctl enable httpd
wget https://www.tooplate.com/zip-templates/2124_vertex.zip
unzip -o 2124_vertex.zip
cp -r 2124_vertex/* /var/www/html/
systemctl restart httpd
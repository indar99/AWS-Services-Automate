#!/bin/bash

yum install -y httpd
echo "hello load balancer !!!" >>/var/www/html/index.html
systemctl restart httpd

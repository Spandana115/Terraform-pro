#!/bin/bash
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "<h1>Hello world i am spandana iam doing an project based on terraform $(hostname -f)</h1>" > /var/www/html/index.html

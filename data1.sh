#!/bin/bash
# Update packages and install Apache and Git
yum update -y
yum install -y httpd 
systemctl start httpd
systemctl enable httpd
yum install git -y
sudo git clone https://github.com/Spandana115/kider.git
sudo mv kider/preschool-website-template/* /var/www/html/

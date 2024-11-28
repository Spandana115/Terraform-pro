#!/bin/bash
# Update packages and install Apache and Git
yum update -y
yum install -y httpd 
systemctl start httpd
systemctl enable httpd
yum install git -y
sudo git clone https://github.com/Spandana115/Anticafe.git
sudo mv Anticafe/2126_antique_cafe/* /var/www/html/

#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "hello world from $(hostname -f)" > /var/www/html/index.html
sudo systemctl restart httpd

yum install -y yum-utils shadow-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
yum -y install terraform
terraform init
terraform apply --auto-approve


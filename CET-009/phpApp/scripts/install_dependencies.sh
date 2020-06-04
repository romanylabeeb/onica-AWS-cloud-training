#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd.service
firewall-cmd --add-service=http --permanent
firewall-cmd --reload
yum -y install epel-release
yum-config-manager --enable remi-php72
 yum update -y
 yum install php -y

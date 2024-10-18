#!/bin/bash

# Update system packages
sudo yum update -y

# Install NGINX
sudo amazon-linux-extras enable nginx1
sudo yum install nginx -y

# Start NGINX service
sudo systemctl start nginx

# Enable NGINX to start on boot
sudo systemctl enable nginx
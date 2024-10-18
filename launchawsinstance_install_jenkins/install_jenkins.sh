#!/bin/bash

sudo yum update -y
# Commands for Jenkins install, start and enable 
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
# Required dependencies for the jenkins package
sudo yum install java-17* -y
sudo yum install fontconfig java-17-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl status jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

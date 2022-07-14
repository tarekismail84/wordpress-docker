#!/bin/bash

#Change user to ec2-user#
sudo su ec2-user

#Install docker, run#
sudo yum install docker -y


#Add group membership for the default ec2-user so you can run all docker commands without using the sudo command#
sudo usermod -a -G docker ec2-user
id ec2-user

# Reload a Linux user's group assignments to docker w/o logout#
newgrp docker

#docker-compose installation#
wget https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) 
sudo mv docker-compose-$(uname -s)-$(uname -m) /usr/local/bin/docker-compose
sudo chmod -v +x /usr/local/bin/docker-compose

##enable auto start and enable docker service##
sudo systemctl enable --now docker.service



#add docker compose path to all users#
sudo cat /home/ec2-user/bash_profile_path.txt >> /etc/skel/.bash_profile
sudo cat /home/ec2-user/bash_profile_path.txt >> /home/ec2-user/.bash_profile
sudo cat /home/ec2-user/bash_profile_path.txt >> /home/ssm-user/.bash_profile
sudo cat /home/ec2-user/bash_profile_path.txt >> /root/.bash_profile


##Updating yml file
sudo sed -i "s|exampledb|$1|g" /home/ec2-user/website1/docker-compose.yml
sudo sed -i "s|exampleuser|$2|g" /home/ec2-user/website1/docker-compose.yml
sudo sed -i "s|examplepass|$3|g" /home/ec2-user/website1/docker-compose.yml
sudo sed -i "s|db|$4|g" /home/ec2-user/website1/docker-compose.yml



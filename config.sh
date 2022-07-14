#!/bin/bash



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



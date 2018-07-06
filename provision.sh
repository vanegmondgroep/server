#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y samba zip php7.2 php7.2-cli php7.2-mbstring php7.2-curl php7.2-mysql mysql-client

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Composer
sudo wget https://getcomposer.org/composer.phar
sudo mv composer.phar /bin/composer
sudo chmod +x /bin/composer

# Setup Docker Swarm
sudo docker swarm init --advertise-addr 192.168.25.100

# Setup samba
sudo chown -R nobody.nogroup /srv
sudo chmod -R 777 /srv
sudo chgrp nogroup /srv
sudo chmod g+s /srv

sudo mv -f /home/vagrant/smb.conf /etc/samba/smb.conf
sudo service smbd restart

# Setup hosts file
sudo echo "127.0.0.1 db" >> /etc/hosts

# Setup git configuration
git config --global core.eol lf
git config --global core.autocrlf input
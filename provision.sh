#!/usr/bin/env bash

# Install packages
sudo apt-get update
sudo apt-get install -y samba zip mysql-client python-pip

# Install Docker Composes
sudo pip install docker-compose

# Add Van Egmond user
sudo useradd -m vanegmond
sudo usermod -aG sudo vanegmondd
sudo usermod -aG docker vanegmond
sudo cp -R /home/vagrant/.ssh /home/vanegmond/.ssh
sudo touch /home/vanegmond/.bash_profile && echo "cd /srv" >> /home/vanegmond/.bash_profile
sudo chown -R vanegmond:vanegmond /srv
sudo chown -R vanegmond:vanegmond /home/vanegmond
sudo chsh -s /bin/bash vanegmond

echo 'vanegmond ALL=(ALL) NOPASSWD: ALL' | sudo tee --append /etc/sudoers

# Setup samba
sudo mv -f /home/vagrant/smb.conf /etc/samba/smb.conf
sudo service smbd restart

sudo echo -e "secret\nsecret" | sudo smbpasswd -s -a vanegmond

# Setup hosts file
sudo echo "127.0.0.1 db" >> /etc/hosts

# Setup backup script
sudo mv -f /home/vagrant/backup.sh /usr/local/bin/backup
sudo chmod +x /usr/local/bin/backup

# Setup git configuration
git config --global core.eol lf
git config --global core.autocrlf input
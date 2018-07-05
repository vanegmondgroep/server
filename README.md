# Vagrant Development Server
This server is used at Van Egmond Groep to develop our applications. It's basically a virtual Ubuntu 18.04 server with PHP, Composer, Samba and Docker pre-installed.

## Requirements 
* [Vagrant](https://www.vagrantup.com/) 

## Usage
1. Clone this repository to your computer.
1. Navigate to the folder in your terminal or command prompt.
1. Run `vagrant up` to start the server.
1. Run `vagrant ssh` to login to the server.

## Accessing shared files
Due to speed issues with shared drives using Vagrant/VirtualBox on Windows we've installed samba on the guest machine. To access the shared files navigate to `192.168.25.100`. You can clone any repository to the shared `srv` folder.
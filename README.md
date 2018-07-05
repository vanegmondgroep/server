# Vagrant Development Server
This server is used at Van Egmond Groep to develop our applications. It's basically a virtual Ubuntu 18.04 server with PHP, Composer, Samba and Docker pre-installed.

## Requirements 
* [Vagrant](https://www.vagrantup.com/) 

## Usage
1. Clone this repository to your computer.
1. Navigate to the folder in your terminal or command prompt.
1. Run `vagrant up` to start the server.
1. Run `vagrant ssh` to login to the server.
1. Run `vagrant halt` to stop the server.
1. Run `vagrant up --provision` to reprovision the server.

## Accessing shared files
shared files navigate to `192.168.25.100`. You can clone any repository to the shared `srv` folder.

## Hosts updater
Install the vagrant hosts updater plugin to update your hosts file while starting the development server. The server is then available via `app.local` in your browser. You can install this plugin using the command below (on your host machine):

```
vagrant plugin install vagrant-hostsupdater
```
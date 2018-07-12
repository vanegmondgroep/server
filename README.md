# Vagrant Development Server
This server is used at Van Egmond Groep to develop our applications. It's basically a virtual Ubuntu 18.04 server with [Docker](https://www.docker.com/), [Docker Compose](https://docs.docker.com/compose/) and [Samba](https://nl.wikipedia.org/wiki/Samba_(software)) pre-installed.

## Requirements 
* [Vagrant](https://www.vagrantup.com/) 
* [VirtualBox](https://www.virtualbox.org/)

## Usage
1. Clone this repository to your computer.
1. Navigate to the folder in your terminal or command prompt.
1. Run `vagrant up` to start the server.
1. Run `vagrant ssh` to login to the server.
1. Run `vagrant halt` to stop the server.
1. Run `vagrant up --provision` to reprovision the server.
1. Run `vagrant ssh -c "backup"` to backup your application files to your host computer.

## Accessing shared files
Your application files should live in the `/srv` folder which is shared by Samba to your host machine. To access the shared files navigate to:

* Windows: `\\192.168.25.100\srv` in File Explorer. 
* MacOS / Linux: `smb://192.168.25.100/srv` in Finder / File Manager.

Login with:
```
User: vanegmond
Password: secret
```
*Tip: you can clone any repository to the shared `srv` folder.* 

*Tip: run `sudo smbpasswd -a vanegmond` to change the share password.*

## Hosts updater
Install the vagrant hosts updater plugin to update your hosts file while starting the development server. The server is then available via `app.local` in your browser. You can install this plugin using the command below (on your host machine):

```
vagrant plugin install vagrant-hostsupdater
```
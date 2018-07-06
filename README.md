# Vagrant Development Server
This server is used at Van Egmond Groep to develop our applications. It's basically a virtual Ubuntu 18.04 server with PHP, Composer, Samba and Docker pre-installed.

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

## Accessing shared files
To access the shared files navigate to:

* Windows: `\\192.168.25.100` in File Explorer. 
* MacOS / Linux: `smb://192.168.25.100` in Finder / File Manager.

You can clone any repository to the shared `srv` folder.

## Hosts updater
Install the vagrant hosts updater plugin to update your hosts file while starting the development server. The server is then available via `app.local` in your browser. You can install this plugin using the command below (on your host machine):

```
vagrant plugin install vagrant-hostsupdater
```

## Known issues

* Sometimes Git applications like GitHub Desktop and GitKraken can't do their work from a (samba) network drive due file permission issues. Run `sudo chmod -R 777 /srv` from within the Vagrant box to reset file permissions.
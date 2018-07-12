Vagrant.require_version ">= 1.7.0"

Vagrant.configure(2) do |config|
    config.vm.provider "virtualbox" do |v|
        v.cpus = "2"
        v.memory = "4096"
    end

    VAGRANT_COMMAND = ARGV[0]
    if VAGRANT_COMMAND == "ssh"
        config.ssh.username = 'vanegmond'
    end

    config.vm.box = "ubuntu/bionic64"
    config.vm.hostname = 'app.local'
    config.vm.network "public_network"
    config.vm.network "private_network", ip: "192.168.25.100"
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder "backups/", "/srv/backups"
    config.vm.provision "file", source: "./smb.conf", destination: "/home/vagrant/smb.conf"
    config.vm.provision "file", source: "./backup.sh", destination: "/home/vagrant/backup.sh"
    config.vm.provision "docker"
    config.vm.provision :shell, path: "provision.sh"
end

Vagrant.require_version ">= 1.7.0"

Vagrant.configure(2) do |config|
    config.vm.define "app" do |app|
        app.vm.box = "ubuntu/bionic64"
        app.vm.hostname = 'app.local'
        app.vm.network :private_network, ip: "192.168.25.100"
        app.vm.synced_folder ".", "/vagrant", disabled: true
		app.vm.provision "file", source: "./smb.conf", destination: "/home/vagrant/smb.conf"
        app.vm.provision "docker"
        app.vm.provision :shell, path: "provision.sh"
    end
end
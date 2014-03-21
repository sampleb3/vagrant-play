# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "VagrantPlay"
  config.vm.hostname = "VagrantPlay"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v0.1.0/centos64-x86_64-20131030.box"

  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.network :forwarded_port, guest: 80, host: 8082 # http
  config.vm.network :forwarded_port, guest: 3306, host: 8806 # mysql
  config.vm.network :forwarded_port, guest: 10000, host: 10000 # webmin
  config.vm.network :forwarded_port, guest: 9000, host: 9000 # play

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks", "chef/vendor/cookbooks", "chef/site-cookbooks"]
    chef.json = JSON.parse(File.read("localhost.json"))

    # chef.log_level = :debug
  end

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

end

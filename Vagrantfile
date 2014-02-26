# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos63"
  config.vm.hostname = "centos63"
  config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"

  config.vm.provider :virtualbox do |vb|
    # vb.gui = true
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.network :forwarded_port, guest: 80, host: 8082
  config.vm.network :forwarded_port, guest: 3306, host: 8806
  config.vm.network :forwarded_port, guest: 10000, host: 10000

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["chef/cookbooks", "chef/vendor/cookbooks", "chef/site-cookbooks"]
    chef.roles_path = "chef/roles"
    chef.run_list = ["role[test_server]"]
  
    # chef.log_level = :debug
  end

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

end

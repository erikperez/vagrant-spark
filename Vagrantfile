# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # set to false, if you do NOT want to check the correct VirtualBox Guest Additions version when booting this box
  if defined?(VagrantVbguest::Middleware)
      config.vbguest.auto_update = true
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 4200, host: 4200

  config.vm.provider :virtualbox do |vb|
    vb.name = "Vagrant Spark Standalone VM"
    vb.customize ["modifyvm", :id, "--cpus", "2", "--memory", "4096"]
  end

  config.vm.provision :shell,
    :keep_color => true,
    :path => "provision/setup.sh"

end

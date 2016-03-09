# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', 2048,
                  '--cpus', 2, '--ioapic', 'on']
  end
  # ---------------------------------------------------------------------------
  # Global properties
  # ---------------------------------------------------------------------------
  config.vm.box = "MikeMorrow/centos.7.2"
  # config.vm.box  = "ubuntu/trusty64"
  # config.vm.box  = "ubuntu/vivid64"
  # ---------------------------------------------------------------------------
  # Hypervisor
  # ---------------------------------------------------------------------------
  config.vm.define :server do |server|
    server.vm.network :private_network, ip: "192.168.3.30"
    server.vm.hostname = 'Server'
    server.vm.provision "shell", path: "scripts/setupEnvironment.sh"
    server.vm.provision "shell", path: "scripts/installServer.sh"
  end
  # ---------------------------------------------------------------------------
  #  Client
  # ---------------------------------------------------------------------------
  # config.vm.define :client do |client|
  #   client.vm.network :private_network, ip: "192.168.3.10"
  #   client.vm.hostname = 'client'
  #   client.vm.provision "shell", path: "scripts/setupEnvironment.sh"
  # end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :
#
Vagrant.require_version ">= 1.7.4"

Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |v|
    v.gui = true
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--cpus", 2]
    v.customize ["modifyvm", :id, "--vram", 128]
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    v.customize ["modifyvm", :id, "--accelerate3d", "on"]
    v.customize ["modifyvm", :id, "--accelerate2dvideo", "on"]
  end

  config.vm.box = "StefanScherer/windows_2019"

  config.vm.define "win1" do |win1|
    win1.vm.network "private_network", ip: "192.168.33.10"
    win1.vm.network "forwarded_port", guest: 18443, host: 18443
    win1.vm.provision "shell", path: "win1.bat", privileged: false
  end
  config.vm.define "win2" do |win2|
    win2.vm.network "private_network", ip: "192.168.33.11"
    win2.vm.network "forwarded_port", guest: 18443, host: 28443
    win2.vm.provision "shell", path: "win2.bat", privileged: false
  end
  config.vm.define "win3" do |win3|
    win3.vm.network "private_network", ip: "192.168.33.13"
    win3.vm.network "forwarded_port", guest: 18443, host: 38443
    win3.vm.provision "shell", path: "win3.bat", privileged: false
  end
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "rcw3bb/ubuntu-nagios3"
  config.vm.network "forwarded_port", guest: 80, host: 7777, id: "nagios", auto_correct: true
  config.vm.provision "shell", path: "provision.sh"
end

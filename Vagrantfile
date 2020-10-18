# -*- mode: ruby -*-
# vi: set ft=ruby :

N=3

Vagrant.configure("2") do |config|
  # plugins
  config.vagrant.plugins = "vagrant-parallels"

  # vm
  config.vm.box = "bento/ubuntu-20.04"

  config.vm.provider "parallels" do |prl|
    prl.linked_clone = false
    prl.update_guest_tools = false
    prl.memory = 2048
    prl.cpus = 1
  end

  config.vm.provision :shell, path: "provision/bootstrap.sh"

  (0..N - 1).each do |i|
    name = "k8s-node-#{i}"
    config.vm.define name do |node|
      node.vm.hostname = name
      node.vm.network "private_network", ip: "192.168.100.#{i}"
      node.vm.provider "parallels" do |prl|
        prl.name = name
      end
      if (i == 0)
        config.vm.network 'forwarded_port', guest: 22,    host: 2166,  id: 'ssh',       host_ip: '127.0.0.1', auto_correct: true
        config.vm.network 'forwarded_port', guest: 80,    host: 8000,  id: 'ingress',   host_ip: '127.0.0.1', auto_correct: true
        config.vm.network 'forwarded_port', guest: 8080,  host: 8080,  id: 'apiserver', host_ip: '127.0.0.1', auto_correct: true
        config.vm.network 'forwarded_port', guest: 32000, host: 32000, id: 'registry',  host_ip: '127.0.0.1', auto_correct: true
        node.vm.provision "shell", path: "provision/k8s-master-bootstrap.sh", env: {"NUMBER_OF_JOINER" => N - 1}
      else
        node.vm.provision "shell", path: "provision/k8s-node-bootstrap.sh", env: {"INSTANCE_ID" => i}
      end
    end
  end
end

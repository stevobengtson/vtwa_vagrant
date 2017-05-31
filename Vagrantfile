# -*- mode: ruby -*-
# vi: set ft=ruby :

# Requirements:
# vagrant-dns: https://github.com/BerlinVagrant/vagrant-dns
require File.dirname(__FILE__) + '/dependency_manager'
check_plugins ['vagrant-dns', 'vagrant-disksize']

Vagrant.configure('2') do |config|
  config.vm.box = 'bento/ubuntu-16.04'
  config.vm.box_version = '2.3.1'

  config.disksize.size = '80GB'

  config.dns.tld = 'varsitytutors.dev'
  config.vm.hostname = 'vtwa'
  config.dns.patterns = [/^.*varsitytutors.dev$/]

  config.vm.synced_folder '../varsitytutors', '/vagrant', type: 'nfs', mount_options: ['rw', 'vers=3', 'tcp', 'fsc']  # the fsc is for cachedfilesd
  config.vm.synced_folder '.', '/opt/build'

  config.vm.network :private_network, ip: '10.10.10.99'

  config.vm.network :forwarded_port, guest: 3306, host: 3306
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 443, host: 8443
  config.vm.network :forwarded_port, guest: 1080, host: 1080

  config.vm.provision :shell, path: 'common.sh'
  config.vm.provision :shell, path: 'mysql_install.sh'
  config.vm.provision :shell, path: 'redis_install.sh'
  config.vm.provision :shell, path: 'mailcatcher_install.sh'
  config.vm.provision :shell, path: 'nginx_install.sh'
  config.vm.provision :shell, path: 'rails_install.sh', privileged: false

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'VTWA'
    vb.memory = 4096
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
  end
end

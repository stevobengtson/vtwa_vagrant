# -*- mode: ruby -*-
# vi: set ft=ruby :

# Requirements:
# vagrant-dns: https://github.com/BerlinVagrant/vagrant-dns
require File.dirname(__FILE__) + '/dependency_manager'
check_plugins ['vagrant-dns', 'vagrant-triggers']

Vagrant.configure('2') do |config|
  config.vm.define 'mysql' do |db|
    db.vm.box = 'stevobengtson/vt-mysql-5.6'
    db.vm.hostname = 'vt-mysql'

    db.dns.tld = 'vt-mysql.dev'
    db.vm.hostname = 'vt-mysql'
    db.dns.patterns = [/^.*vt-mysql.dev$/]

    db.vm.network :private_network, ip: '10.10.11.3'
    db.vm.network :forwarded_port, guest: 3306, host: 3306
    db.vm.network :forwarded_port, guest: 22, host: 10122, id: "ssh"

    db.vm.provider 'virtualbox' do |vb|
      vb.name = 'vt-mysql'
      vb.memory = 1024
      vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
      vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
    end
  end

  config.vm.define 'mailcatcher' do |mail|
    mail.vm.box = 'stevobengtson/mailcatcher'
    mail.vm.hostname = 'vt-mailcatcher'

    mail.dns.tld = 'mailcatcher.dev'
    mail.vm.hostname = 'mailcatcher'
    mail.dns.patterns = [/^.*mailcatcher.dev$/]

    mail.vm.network :private_network, ip: '10.10.11.4'
    mail.vm.network :forwarded_port, guest: 1080, host: 1080
    mail.vm.network :forwarded_port, guest: 22, host: 10222, id: "ssh"

    mail.vm.provider 'virtualbox' do |vb|
      vb.name = 'mailcatcher'
      vb.memory = 512
      vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
      vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
    end
  end

  config.vm.define 'rails', primary: true do |rails|
    rails.vm.box = 'bento/ubuntu-16.04'
    rails.vm.box_version = '2.3.1'

    rails.dns.tld = 'varsitytutors.dev'
    rails.vm.hostname = 'vtwa'
    rails.dns.patterns = [/^.*varsitytutors.dev$/]

    rails.vm.synced_folder '../varsitytutors', '/vagrant', type: 'nfs', mount_options: ['rw', 'vers=3', 'tcp', 'fsc']  # the fsc is for cachedfilesd
    rails.vm.synced_folder '../vt_sales_mentor', '/vt_sales_mentor', type: 'nfs', mount_options: ['rw', 'vers=3', 'tcp', 'fsc']  # the fsc is for cachedfilesd
    rails.vm.synced_folder '.', '/opt/build'

    rails.vm.network :private_network, ip: '10.10.10.18'
    rails.vm.network :private_network, ip: '10.10.11.2'
    rails.vm.network :forwarded_port, guest: 22, host: 10322, id: "ssh"
    rails.vm.network :forwarded_port, guest: 80, host: 8080
    rails.vm.network :forwarded_port, guest: 443, host: 8443

    rails.ssh.forward_agent = true

    rails.vm.provision :shell, path: 'common.sh'
    rails.vm.provision :shell, path: 'redis_install.sh'
    rails.vm.provision :shell, path: 'nginx_install.sh'
    rails.vm.provision :shell, path: 'rails_install.sh', privileged: false

    rails.vm.provider 'virtualbox' do |vb|
      vb.name = 'VTWA'
      vb.memory = 3072
      vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
      vb.customize ['modifyvm', :id, '--cableconnected1', 'on']
    end

    config.trigger.after :up do
      run 'vagrant dns --install'
      run 'vagrant dns --start'
    end

    config.trigger.after :destroy do
      run 'vagrant dns --uninstall'
    end
  end
end

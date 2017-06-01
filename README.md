# VTWA in Vagrant

## Prerequisites

1. [Vagrant](https://www.vagrantup.com/)
2. [VirtualBox](https://www.virtualbox.org/)
3. Check out this branch beside varsitytutors

```
$ pwd
/Users/[username]/projects

$ ls
varsitytutors
vtwa_vagrant
```

## Setup

1. `$ vagrant up` - You will need to enter your admin password to setup nfs
2. `$ vagrant ssh`
3. `vagrant@vtwa$ cd /vagrant && bundle exec rails s`

You will now be able to access varistytutors web site at https://www.varistytutors.dev and the
database at mysql://root:password@localhost:3306/varsitytutors_development. Also if needed (although less lately)
you can access mailcatcher at http://localhost:1080.

## Todo:
* Run rails server using passenger
* Add ssh keys from user to vm
* Add git to vm, depends on ssh
* Run rubocop from Atom/Sublime in vm
* Run rake commands easily through vm

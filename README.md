# VTWA in Vagrant

## Prerequisites

1. [Vagrant](https://www.vagrantup.com/)
2. [VirtualBox](https://www.virtualbox.org/)
3. Check out this branch beside varsitytutors

```
$ pwd
/Users/steven/projects

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
<input type="checkbox" id="todo_server"><label for="todo_server">Run rails server using passenger</label>
<input type="checkbox" id="todo_ssh"><label for="todo_ssh">Add ssh keys from user to vm</label>
<input type="checkbox" id="todo_git"><label for="todo_git">Add git to vm, depends on ssh</label>
<input type="checkbox" id="todo_rubocop"><label for="todo_rubocop">Run rubocop from Atom/Sublime in vm</label>
<input type="checkbox" id="todo_rake"><label for="todo_rake">Run rake commands easily through vm</label>

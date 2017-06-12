#!/usr/bin/env bash
# Note this is run as the vagrant user instead of root for rvm

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash
source /home/vagrant/.rvm/scripts/rvm
# TODO: Use .ruby-version and .ruby-gemset?
rvm install ruby-2.3.1
rvm use ruby-2.3.1
rvm gemset create varsitytutors
pushd /vagrant
echo 'gem: --no-document' >> ~/.gemrc

sed -i '/^export MAILCATCHER_ADDRESS=.*$/d' ~/.profile
echo 'export MAILCATCHER_ADDRESS=10.10.11.4' >> ~/.profile

export MAILCATCHER_ADDRESS=10.10.11.4

gem install bundler
bundle install
bundle exec rake db:reset
RAILS_ENV=test bundle exec rake db:reset

popd

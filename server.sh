#!/bin/bash

source ~/.profile

pushd /vagrant
bundle check || bundle install
rm log/*.log
bundle exec rails s -b 0.0.0.0 -p 3000
popd

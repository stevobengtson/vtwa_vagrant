#!/usr/bin/env bash

apt-get update -y -q
apt-get install -y -q imagemagick jpegoptim cachefilesd git vim curl python-software-properties libcurl4-openssl-dev libmysqlclient-dev

# Setup nodejs
pushd /tmp
curl -sSL https://deb.nodesource.com/setup_6.x -o nodejs.sh
cat /tmp/nodejs.sh | bash -
apt-get update -y -q
apt-get install -y -q nodejs
echo "RUN=yes" > /etc/default/cachefilesd
popd

# Setup Puma folders
mkdir -p /puma/shared
mkdir -p /puma/shared/pids /puma/shared/sockets /puma/shared/log
chown -R vagrant:vagrant /puma
ln -s /opt/build/nginx/puma.rb /puma/puma.rb


# To help speed up git
pushd /vagrant
git config core.preloadindex true
popd

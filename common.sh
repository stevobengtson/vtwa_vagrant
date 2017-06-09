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

# To help speed up git
pushd /vagrant
git config core.preloadindex true
popd

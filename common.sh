#!/usr/bin/env bash

pushd /tmp
curl -sSL https://deb.nodesource.com/setup_6.x -o nodejs.sh
cat /tmp/nodejs.sh | bash -
apt-get update -y -q
apt-get install -y -q nodejs imagemagick jpegoptim cachefilesd git vim
echo "RUN=yes" > /etc/default/cachefilesd
git config core.preloadindex true
popd

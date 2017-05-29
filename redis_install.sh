#!/usr/bin/env bash

apt-get update -q
apt-get -y -q install redis-server
sed -i "s/^bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf
service redis-server restart

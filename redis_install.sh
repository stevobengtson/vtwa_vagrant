#!/usr/bin/env bash

apt-get install -y -q redis-server
sed -i "s/^bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf
service redis-server restart

#!/usr/bin/env bash

apt-get update
apt-get install -y -q nginx

mkdir -p /etc/nginx/sites-enabled
mkdir -p /etc/nginx/ssl
cp -u /opt/build/nginx/nginx.conf /etc/nginx/
cp -u /opt/build/nginx/varsitytutors.dev /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/varsitytutors.dev /etc/nginx/sites-enabled/varsitytutors.dev
cp -u /opt/build/nginx/certs/* /etc/nginx/ssl

service nginx restart

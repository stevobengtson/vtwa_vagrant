#!/usr/bin/env bash

# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
# apt-get install -y apt-transport-https ca-certificates
# Add Passenger APT repository
# sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
# apt-get update
# Install Passenger & Nginx
# apt-get install -y nginx-extras passenger
# sed -i 's/# include \/etc\/nginx\/passenger.conf;/include \/etc\/nginx\/passenger.conf;/' /etc/nginx/nginx.conf

# Setup Puma
cp /opt/build/nginx/puma.service /etc/systemd/system/puma.service
service puma restart

# Setup Nginx
apt-get install -y -q nginx

mkdir -p /etc/nginx/sites-enabled
mkdir -p /etc/nginx/ssl
cp -u /opt/build/nginx/nginx.conf /etc/nginx/
cp -u /opt/build/nginx/varsitytutors.dev /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/varsitytutors.dev /etc/nginx/sites-enabled/varsitytutors.dev
cp -u /opt/build/nginx/certs/* /etc/nginx/ssl

service nginx restart

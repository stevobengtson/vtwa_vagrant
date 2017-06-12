#!/bin/bash

apt-get install -y -q build-essential libsqlite3-dev ruby-dev curl

gem install --no-ri --no-rdoc mailcatcher

cat > /lib/systemd/system/mailcatcher.service <<- EOM
[Unit]
Description=Mailcatcher Service
After=network.service vagrant.mount
[Service]
Type=simple
ExecStart=/usr/local/bin/mailcatcher --foreground --ip 0.0.0.0
Restart=always
[Install]
WantedBy=multi-user.target
EOM

systemctl enable mailcatcher
service mailcatcher restart

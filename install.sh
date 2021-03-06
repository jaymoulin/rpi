#!/usr/bin/env bash

echo -e "\033[1;31mInstalling Python...\033[0m"

sudo apt-get remove python3-pip -y
sudo apt-get install python3-pip -y
sudo -H easy_install3 pip
sudo -H pip install --upgrade pip

echo -e "\033[1;31mInstalling Docker\033[0m"
curl -sSL https://get.docker.com | sudo sh && sudo usermod -aG docker $USER && sudo -H pip3 install docker-compose -U

echo -e "\033[1;31mInstalling Docker logrotate\033[0m"
echo -e "/var/lib/docker/containers/*/*.log {
  rotate 7
  daily
  compress
  size=1M
  missingok
  delaycompress
  copytruncate
}" | sudo tee --append /etc/logrotate.d/docker-container

echo -e "\033[1;31mDone!\033[0m"

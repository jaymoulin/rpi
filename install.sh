#!/usr/bin/env bash

echo -e "\033[1;31mInstalling Docker\033[0m"
curl -sSL https://get.docker.com | sudo sh && sudo usermod -aG docker $USER && sudo apt-get install docker-compose-plugin -y

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

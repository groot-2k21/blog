#!/bin/bash
# установка zabbix агента для мониторинга
sudo apt install zabbix-agent -y


# Установка docker в ubuntu
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io

# установка DockerCompose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#Созаем сервис для Systemd
sudo cp blog.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable blog.service

# запуск сервиса с блогом
sudo systemctl start blog.service

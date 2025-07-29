#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install -y nginx
sudo systemctl enable --now nginx
echo  "create test page"
echo "<h1>My Linux-server work!</h1>" | sudo tee /var/www/html/index.html

echo "download Docker..."

curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker ubuntu
newgrp docker 

echo "start Prometheus"
docker run -d --name=prometheus -p 9090:9090 prom/prometheus

echo "start grafana"
docker run -d --name=grafana -p 3000:3000 grafana/grafana

echo "settings firewall"
sudo apt install -y ufw
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 3000/tcp
sudo ufw allow 9090/tcp
sudo ufw --force enable
echo "download Fail2Ban"
sudo apt install -y fail2Ban
sudo systemctl enable --now fail2ban

echo "server is ready"
echo "-web-page: http://$(curl -s ifconfig.me)"
echo "- Grafana: http://$(curl -s ifconfig.me):3000"
echo "- Prometheus: http://$(curl -s infconfig.me):9090"

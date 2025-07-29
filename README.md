**Автоматическая настройка Linux-сервера**
Скрипт setup_server.sh разворачивает готовый сервер на Ubuntu с:
 - Nginx (веб-сервер);
 - Prometheus + Grafana (мониторинг);
 - Fail2Ban + UFW (безопасность);
 - Docker (контейнеризация).

**Установка**
1. Клонируйте репозиторий
git clone https://github.com/ваш-логин/linux-server-auto-setup.git
cd linux-server-auto-setup

2. Дайте права на выполнение и запустите скрипт
chmod +x setup_server.sh
sudo ./setup_server.sh

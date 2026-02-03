# Instalace Pterodactyl – přehled architektury
# Pterodactyl má 2 části:
# - Panel – web (Laravel, PHP, MySQL)
# - Wings – daemon pro běh herních serverů (Docker)

# Databáze (MariaDB v Dockeru)
docker volume create mariadb_data
docker run -d \
  --name mariadb \
  -e MYSQL_ROOT_PASSWORD=STRONG_ROOT_PASS \
  -e MYSQL_DATABASE=pterodactyl \
  -e MYSQL_USER=ptero \
  -e MYSQL_PASSWORD=STRONG_DB_PASS \
  -v mariadb_data:/var/lib/mysql \
  --restart unless-stopped \
  mariadb:10.11

# Redis (nutné)
docker run -d \
  --name redis \
  --restart unless-stopped \
  redis:alpine

# Pterodactyl Panel (Docker)
mkdir -p /opt/pterodactyl
cd /opt/pterodactyl

# do složky předat pterodactyl.yml

# Spuštění:
docker compose up -d

# Inicializace panelu
docker exec -it pterodactyl-panel bash

# php artisan key:generate --force
php artisan migrate --seed --force
php artisan p:user:make
exit

# Instalace Wings (herní daemon)
mkdir -p /etc/pterodactyl

# Stáhni wings:
curl -L -o /usr/local/bin/wings \
https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
chmod +x /usr/local/bin/wings

Systemd service

nano /etc/systemd/system/wings.service

[Unit]
Description=Pterodactyl Wings
After=docker.service
Requires=docker.service

[Service]
User=root
LimitNOFILE=4096
ExecStart=/usr/local/bin/wings
Restart=on-failure

[Install]
WantedBy=multi-user.target

systemctl daemon-reload
systemctl enable --now wings

# Propojení Panel ↔ Wings
# V panelu:
#    Nodes → Create Node
#    zkopíruj config.yml
#    vlož do /etc/pterodactyl/config.yml

# Restart:
systemctl restart wings

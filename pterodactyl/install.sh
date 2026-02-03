#!/bin/bash
set -e

BASE_DIR="/pterodactyl"

echo "➡️ Creating directories..."
mkdir -p $BASE_DIR/volumes/{mariadb,panel}
cd $BASE_DIR

echo "➡️ Starting infrastructure (DB + Redis)..."
docker compose -f docker-compose.infra.yml up -d

echo "⏳ Waiting for database..."
sleep 15

echo "➡️ Starting Pterodactyl panel..."
docker compose -f docker-compose.panel.yml up -d

echo "➡️ Initializing Pterodactyl..."
docker exec -it ptero-panel php artisan key:generate --force
docker exec -it ptero-panel php artisan migrate --seed --force

echo "➡️ Create admin user:"
docker exec -it ptero-panel php artisan p:user:make

echo "✅ Done!"

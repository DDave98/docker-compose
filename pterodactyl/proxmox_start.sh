apt update && apt upgrade -y
apt install -y curl wget sudo ca-certificates gnupg lsb-release

# Instalace Dockeru (oficiální cesta)
curl -fsSL https://get.docker.com | sh

# Docker Compose (plugin)
mkdir -p ~/.docker/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64 \
-o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

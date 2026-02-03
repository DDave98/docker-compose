# Struktura složek pro herní server:
/pterodactyl
├── docker-compose.infra.yml   # DB + Redis
├── docker-compose.panel.yml   # Panel
├── install.sh                 # instalační skript
└── volumes/
    ├── mariadb/
    └── panel/

# Postup pro instalaci
1. stáhnout složku
2. nastavit oprávnění: chmod +x /pterodactyl/install.sh
3. spustit skript install.sh

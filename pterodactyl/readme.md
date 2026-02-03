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

## Proxmox
Pro případ, že server je v proxmoxu a jedná se o LXC, pak extra krok (doporučený, ale ne povinný),
kvůli Dockeru + Wings je dobré přidat ručně:

lxc.apparmor.profile: unconfined
lxc.cgroup.devices.allow: a
lxc.cap.drop:

do: nano /etc/pve/lxc/CTID.conf
Pak: pct restart CTID

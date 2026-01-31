# 📁 Doporučená struktura složek

/data/
├── qbittorrent/
│   └── config/
└── downloads/
    ├── incomplete/
    ├── movies/
    ├── series/
    ├── music/
    └── books/

# Vytvoření + práva:
mkdir -p /data/qbittorrent/config
mkdir -p /data/downloads/{incomplete,movies,series,music,books}
chown -R 1000:1000 /data/qbittorrent /data/downloads

## ▶️ Spuštění
docker compose up -d

## Web UI:
http://IP_SERVERU:8080

## 🔑 Default login (linuxserver image):
- uživatel: admin
- heslo: najdeš v logu:
- docker logs qbittorrent

# 🔐 Doporučené nastavení po prvním přihlášení

V Settings → Downloads:
Default Save Path:
/downloads

Incomplete torrents:
/downloads/incomplete

V Settings → Web UI:
změň heslo
případně omez přístup (LAN only / auth)

# 🧠 Tipy do homelabu
- 📚 /downloads/books → Kavita / AudioShelf
- 🎬 /downloads/movies → Jellyfin
- 📺 /downloads/series → Jellyfin
- 🔒 dej to za VPN nebo reverse proxy
- 🧊 můžeš dát read-only mounty do media serverů

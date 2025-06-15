# server-stats

````markdown
# 🖥️ server-stats.sh

Script Bash simple et puissant pour analyser les performances d’un serveur Linux en un clin d'œil ⚡
🔗 **URL du projet GitHub** : [project URL](https://github.com/raymond-odounhitan2000/server-stats)


## 🚀 Objectif

Ce script permet d’obtenir rapidement les statistiques essentielles d’un serveur, telles que :

- Utilisation du **CPU**
- Utilisation de la **mémoire**
- Utilisation du **disque**
- **Top 5** des processus les plus gourmands en CPU et en mémoire
- Bonus : informations système, uptime, utilisateurs connectés, tentatives de connexion échouées...

---

## 📂 Contenu

- `server-stats.sh` — Le script principal

---

## 🛠️ Installation

```bash
git clone https://github.com/raymond-odounhitan2000/server-stats
cd server-stats.sh
chmod +x server-stats.sh
````

---

## ▶️ Utilisation

```bash
./server-stats.sh
```

Lance le script sur **n’importe quelle distribution Linux** (Ubuntu, Debian, CentOS, etc.) et reçois un rapport instantané, stylé et lisible dans ton terminal.

---

## 🧪 Exemple de sortie

```
========== SERVER PERFORMANCE STATS ==========
Date: Sun Jun 15 03:43:02 UTC 2025
Hostname: mon-serveur
Uptime: up 4 days, 3 hours, 20 minutes
OS Version: Ubuntu 22.04.4 LTS

--- CPU USAGE ---
Total CPU usage: 34.7%

--- MEMORY USAGE ---
Used: 1860 MB / 3967 MB (46.90%)

--- DISK USAGE (/ root) ---
Used: 14G / Available: 30G (33%)

--- TOP 5 PROCESSES BY CPU ---
PID   COMMAND         %CPU
1234  firefox         25.0
...

--- TOP 5 PROCESSES BY MEMORY ---
PID   COMMAND         %MEM
2345  chrome          18.6
...

--- LOGGED IN USERS ---
raymond   pts/0   2025-06-15 03:30 (192.168.1.42)

--- FAILED LOGIN ATTEMPTS ---
Failed password for invalid user admin from 10.0.0.10 port 55412 ssh2
...
```

---

## 🔐 Prérequis

Aucun package externe requis. Le script utilise uniquement des commandes Unix standard (`top`, `ps`, `free`, `df`, `who`, `journalctl`, etc.).

---

## 🧠 Auteur

> Développé avec 🧠, 💻 et 🕶️ par [Raymond ODOUNHITAN](https://github.com/raymond-odounhitan2000)

---

## 📝 Licence

Ce projet est sous licence MIT — libre à toi de l’utiliser, le modifier et le distribuer.

---

## 🌍 À propos

*"Parce qu’un serveur qui parle, c’est un admin qui dort tranquille."*
Hack the shell, own the world. 🌐

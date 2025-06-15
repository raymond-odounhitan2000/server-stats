#!/bin/bash

# === COLORS ===
GREEN="\e[32m"
YELLOW="\e[33m"
CYAN="\e[36m"
RESET="\e[0m"

# === HEADER ===
echo -e "${CYAN}========== SERVER PERFORMANCE STATS ==========${RESET}"
echo -e "Date: $(date)"
echo -e "Hostname: $(hostname)"
echo -e "Uptime: $(uptime -p)"
echo -e "OS Version: $(lsb_release -d | cut -f2- || cat /etc/*release | grep PRETTY_NAME)"
echo

# === CPU USAGE ===
echo -e "${YELLOW}--- CPU USAGE ---${RESET}"
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo -e "Total CPU usage: ${CPU_USAGE}%"
echo

# === MEMORY USAGE ===
echo -e "${YELLOW}--- MEMORY USAGE ---${RESET}"
MEM_TOTAL=$(free -m | awk '/^Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/^Mem:/ {print $3}')
MEM_FREE=$(free -m | awk '/^Mem:/ {print $4}')
MEM_PERC=$(awk "BEGIN {printf \"%.2f\", ($MEM_USED/$MEM_TOTAL)*100}")
echo -e "Used: ${MEM_USED} MB / ${MEM_TOTAL} MB (${MEM_PERC}%)"
echo

# === DISK USAGE ===
echo -e "${YELLOW}--- DISK USAGE (/ root) ---${RESET}"
DISK_INFO=$(df -h / | awk 'NR==2')
DISK_USED=$(echo $DISK_INFO | awk '{print $3}')
DISK_AVAIL=$(echo $DISK_INFO | awk '{print $4}')
DISK_USE_PERC=$(echo $DISK_INFO | awk '{print $5}')
echo -e "Used: ${DISK_USED} / Available: ${DISK_AVAIL} (${DISK_USE_PERC})"
echo

# === TOP 5 PROCESSES BY CPU ===
echo -e "${YELLOW}--- TOP 5 PROCESSES BY CPU ---${RESET}"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

# === TOP 5 PROCESSES BY MEMORY ===
echo -e "${YELLOW}--- TOP 5 PROCESSES BY MEMORY ---${RESET}"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo

# === BONUS: LOGGED IN USERS ===
echo -e "${YELLOW}--- LOGGED IN USERS ---${RESET}"
who
echo

# === BONUS: FAILED LOGIN ATTEMPTS (last 10) ===
echo -e "${YELLOW}--- FAILED LOGIN ATTEMPTS ---${RESET}"
journalctl -xe | grep "Failed password" | tail -n 10 2>/dev/null || echo "No access or not using systemd journal"
echo

# === END ===
echo -e "${CYAN}============ END OF REPORT ============${RESET}"

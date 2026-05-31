#!/bin/bash

echo "[*] Starting secured Brutus lab environment..."
echo

# Step 1 — Ensure Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "[ERROR] Docker daemon is not running."
    echo "Please start Docker Desktop (Linux containers mode) and try again."
    exit 1
fi

# Step 2 — Build and start all secured containers
echo "[*] Building and starting secured containers..."
docker compose -f docker-compose.secured.yml up -d --build

if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to start secured environment."
    exit 1
fi

echo
echo "[✔] Secured environment is running."
echo

# Step 3 — Show running containers
echo "[*] Active containers:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

echo
echo "[*] Secured services available:"
echo "    - SSH  : localhost:2222 (secured config + fail2ban)"
echo "    - FTP  : localhost:2121 (rate-limited)"
echo "    - HTTP : http://localhost:8080 (token-based auth)"
echo
echo "[✔] Secured lab is ready for testing."

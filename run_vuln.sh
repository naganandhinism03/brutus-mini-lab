#!/bin/bash

echo "[*] Checking Docker status..."
if ! docker info >/dev/null 2>&1; then
    echo "[!] Docker is not running. Start Docker Desktop and try again."
    exit 1
fi

echo "[*] Stopping old vulnerable containers..."
docker compose -f docker-compose.yml down

echo "[*] Building and starting vulnerable environment..."
docker compose -f docker-compose.yml up --build -d

echo "[*] Vulnerable environment is running!"
echo ""
echo "----------------------------------------"
echo "   Vulnerable Service Endpoints"
echo "----------------------------------------"
echo "SSH  : localhost:22"
echo "FTP  : localhost:21"
echo "HTTP : http://localhost"
echo "----------------------------------------"
echo ""
echo "[*] Use 'docker ps' to verify running containers."

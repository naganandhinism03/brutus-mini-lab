#!/bin/bash

TARGET="ssh_target"
USER="testuser"

echo "[*] Simulating SSH brute-force attempts..."

# 3 failed attempts
for i in {1..3}; do
    sshpass -p "WrongPass$i" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=1 $USER@$TARGET "exit" 2>/dev/null
done

# 1 successful login
sshpass -p "StrongPass!2026" ssh -o StrictHostKeyChecking=no -o ConnectTimeout=1 $USER@$TARGET "echo SUCCESSFUL LOGIN" 2>/dev/null

echo "[*] Simulation complete."

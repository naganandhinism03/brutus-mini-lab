README.md — Brutus Mini‑Lab (SSH + FTP + HTTP)
A Self‑Contained Authentication Brute‑Force Simulation Lab

📌 1. Overview
This mini‑lab provides a fully isolated Docker‑based environment for studying authentication weaknesses across three common network services:

SSH (password authentication)

FTP (vsftpd)

HTTP Basic Authentication (Apache)

The lab includes:

Vulnerable configurations

A dedicated attacker container

Simulated brute‑force patterns

Log analysis workflows

Secured versions for comparison

This environment is designed for educational and research purposes only.

📌 2. Architecture
Code
+------------------+         +------------------+
|  brutus_attacker | <-----> |   ssh_target     |
|  (Python 3.10)   |         |   Port 22        |
+------------------+         +------------------+

+------------------+         +------------------+
|  brutus_attacker | <-----> |   ftp_target     |
|                  |         |   Port 21        |
+------------------+         +------------------+

+------------------+         +------------------+
|  brutus_attacker | <-----> |   http_target    |
|                  |         |   Port 80        |
+------------------+         +------------------+
All containers run on a private Docker network.

📌 3. Features
Vulnerable SSH with password authentication enabled

Vulnerable FTP with weak credentials

HTTP Basic Auth with no rate‑limiting

Attacker container for log analysis

Simulated brute‑force patterns

Secured versions for comparison

Fully reproducible with a single command

📌 4. Prerequisites
Windows 10/11

Docker Desktop (Linux containers mode)

PowerShell

📌 5. Folder Structure
Code
brutus-lab/
│
├── docker-compose.yml
├── ssh/
│   ├── Dockerfile
│   ├── sshd_config.vuln
│   └── sshd_config.secured
│
├── ftp/
│   ├── Dockerfile
│   ├── vsftpd.conf.vuln
│   └── vsftpd.conf.secured
│
├── http/
│   ├── Dockerfile
│   ├── .htpasswd
│   └── apache.conf
│
├── attacker/
│   └── Dockerfile
│
└── README.md
📌 6. Quick Start — Run the Vulnerable Lab
Step 1 — Clone the repository
Code
git clone <your-repo-url>
cd brutus-lab
Step 2 — Build and start the lab
Code
docker compose up --build -d
Step 3 — Verify containers
Code
docker ps
You should see:

ssh_target

ftp_target

http_target

brutus_attacker

📌 7. Service Access
SSH
Code
ssh testuser@127.0.0.1 -p 22
Default password (vulnerable mode):

Code
StrongPass!2026
FTP
Code
ftp 127.0.0.1
Credentials:

Code
Username: testuser
Password: StrongPass!2026
HTTP Basic Auth
Open browser:

Code
http://127.0.0.1
Credentials:

Code
Username: admin
Password: admin
📌 8. Simulated Brute‑Force Evidence
SSH (auth.log)
Code
Failed password for testuser from 172.18.0.5 port 50114 ssh2
Failed password for testuser from 172.18.0.5 port 50115 ssh2
Accepted password for testuser from 172.18.0.5 port 50117 ssh2
FTP (vsftpd.log)
Code
FAIL LOGIN: Client "172.18.0.5", user=testuser
OK LOGIN: Client "172.18.0.5", user=testuser
HTTP (Apache access.log)
Code
"GET /protected HTTP/1.1" 401 -
"GET /protected HTTP/1.1" 200 -
These patterns mimic real brute‑force behavior without performing actual attacks.

📌 9. Log Locations
SSH
Code
docker exec -it ssh_target bash
cat /var/log/auth.log
FTP
Code
docker exec -it ftp_target bash
cat /var/log/vsftpd.log
HTTP
Code
docker exec -it http_target bash
cat /var/log/apache2/access.log
📌 10. Running the Secured Version
To switch to secured configs:

Step 1 — Stop the lab
Code
docker compose down
Step 2 — Edit docker-compose.yml
Switch:

Code
sshd_config.vuln → sshd_config.secured
vsftpd.conf.vuln → vsftpd.conf.secured
Step 3 — Rebuild
Code
docker compose up --build -d
📌 11. Cleanup
To remove all containers:

Code
docker compose down
To remove images:

Code
docker rmi brutus-lab-ssh brutus-lab-ftp brutus-lab-http
📌 12. Credits & Inspiration
This lab was inspired by:

Authentication security research

Password‑based attack simulations

Docker‑based penetration testing labs

Public documentation on SSH, FTP, and HTTP authentication

All configurations are intentionally weakened for educational use.

📌 13. Disclaimer
This environment is for learning and research only.
Do not deploy vulnerable configurations in production.
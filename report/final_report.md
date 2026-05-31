# Brutus Mini-Lab: Authentication Brute-Force Assessment

## 1. Overview
This report documents the simulated brute-force vulnerability assessment performed on SSH, FTP, and HTTP services within a Docker-based mini-lab.

## 2. Environment Setup
- SSH target: Port 22
- FTP target: Port 21
- HTTP target: Port 80
- Attacker container: Python 3.10
- Wordlists: rockyou.txt

## 3. Methodology
1. Verified service availability.
2. Simulated brute-force patterns using controlled failed login attempts.
3. Collected authentication logs.
4. Analyzed detection and mitigation behavior.

## 4. Findings
### SSH
- Multiple failed attempts allowed.
- No rate-limiting or lockout.
- Successful login after repeated failures.

### FTP
- Anonymous login enabled.
- No brute-force protection.
- Successful login after multiple failures.

### HTTP
- Basic Auth used.
- Credentials transmitted in Base64.
- No throttling or lockout.

## 5. Evidence
See `/REPORT/evidence/` for logs and screenshots.

## 6. Impact
All services are vulnerable to brute-force attacks due to lack of rate-limiting and weak password policies.

## 7. Recommendations
- Implement Fail2Ban or SSHGuard.
- Enforce strong password complexity.
- Replace FTP with SFTP.
- Use HTTPS and token-based authentication for web services.
- Enable centralized log monitoring.

## 8. Conclusion
The simulated brute-force analysis confirms that the lab environment demonstrates common authentication weaknesses. Implementing the recommended mitigations will significantly improve resilience against password-guessing attacks.

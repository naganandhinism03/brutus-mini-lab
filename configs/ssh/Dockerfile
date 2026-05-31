# Secure SSH container for Brutus mini-lab
FROM ubuntu:22.04

# Update system and install required packages
RUN apt update && apt install -y openssh-server sudo fail2ban

# Create SSH runtime directory
RUN mkdir /var/run/sshd

# Create secure user
RUN useradd -m testuser && echo "testuser:StrongPass!2026" | chpasswd && usermod -aG sudo testuser

# Harden SSH configuration
COPY sshd_config /etc/ssh/sshd_config

# Fail2ban configs removed for vulnerable build
# COPY fail2ban/jail.local /etc/fail2ban/jail.local
# COPY fail2ban/sshd.local /etc/fail2ban/filter.d/sshd.local


# Expose secured SSH port
EXPOSE 22

# Start both SSH and fail2ban services
CMD ["/usr/sbin/sshd", "-D"]



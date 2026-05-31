# Secured FTP container for Brutus mini-lab
FROM ubuntu:22.04

# Install vsftpd
RUN apt update && apt install -y vsftpd

# Create FTP user with strong password
RUN useradd -m ftpuser && echo "ftpuser:StrongPass!2026" | chpasswd

# Copy hardened vsftpd configuration
COPY vsftpd.conf /etc/vsftpd.conf

# Create FTP directory and set permissions
RUN mkdir -p /home/ftpuser/ftp && \
    chown ftpuser:ftpuser /home/ftpuser/ftp && \
    chmod 755 /home/ftpuser/ftp

# Expose secured FTP port
EXPOSE 21

# Start vsftpd in foreground
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]

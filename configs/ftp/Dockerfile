# Vulnerable FTP container for Brutus mini-lab
FROM ubuntu:22.04

# Install vsftpd
RUN apt update && apt install -y vsftpd

# Create weak FTP user
RUN useradd -m ftpuser && echo "ftpuser:Password123" | chpasswd

# Copy intentionally weak vsftpd config
COPY vsftpd.conf.vuln /etc/vsftpd.conf

# Create FTP directory
RUN mkdir -p /home/ftpuser/ftp && \
    chown ftpuser:ftpuser /home/ftpuser/ftp && \
    chmod 755 /home/ftpuser/ftp

# Expose FTP port
EXPOSE 21

# Start vsftpd in foreground
CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]

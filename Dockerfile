# Utiliser Alpine comme base
FROM alpine:latest

# Installer vsftpd
RUN apk --update add --no-cache vsftpd iptables nmap

# Créer un utilisateur FTP
ARG USER=ftpuser
ARG PASSWORD=password
RUN adduser -D -h /ftp ${USER} && \
    echo "${USER}:${PASSWORD}" | chpasswd && \
    mkdir -p /ftp/upload && \
    chmod 550 /ftp && \
    chmod 750 /ftp/upload && \
    chown ${USER}:${USER} /ftp/upload

# Ajouter le fichier de configuration vsftpd
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

# Exposer les ports nécessaires
EXPOSE 21
EXPOSE 20

# Lancer vsftpd
# CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]

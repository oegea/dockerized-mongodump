# Usa una imagen base de Ubuntu 24.04
FROM ubuntu:24.04

# Instala las herramientas necesarias
RUN apt-get update && apt-get install -y \
    gnupg \
    wget \
    ca-certificates

# Añade la clave GPG y el repositorio de MongoDB
RUN wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add - \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list

# Actualiza la lista de paquetes e instala mongo-tools
RUN apt-get update && apt-get install -y mongodb-org-tools

# Crea un directorio para la aplicación
WORKDIR /app

# Copia el script de backup en el contenedor
COPY backup_script.sh /app/backup_script.sh

# Da permisos de ejecución al script
RUN chmod +x /app/backup_script.sh

# Define el comando de inicio del contenedor
CMD ["/app/backup_script.sh"]

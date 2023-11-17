#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update

# Instalar paquetes necesarios para permitir que apt utilice un repositorio sobre HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Agregar la clave GPG oficial de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Agregar el repositorio estable de Docker al sistema
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Actualizar la lista de paquetes después de agregar el repositorio de Docker
sudo apt update

# Instalar Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Agregar tu usuario al grupo docker para ejecutar comandos Docker sin sudo
sudo usermod -aG docker $USER

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Imprimir información sobre la instalación
echo "Docker y Docker Compose se han instalado correctamente."
echo "Es posible que necesites reiniciar la sesión o el sistema para aplicar los cambios de grupo."

# Mostrar la versión instalada de Docker y Docker Compose
docker --version
docker-compose --version

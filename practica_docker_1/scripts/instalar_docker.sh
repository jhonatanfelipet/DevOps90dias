#!/bin/bash

set -e

echo "🔄 Actualizando paquetes e instalando dependencias..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

echo "🔐 Agregando la clave GPG de Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "📦 Agregando el repositorio oficial de Docker..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Actualizando índice de paquetes..."
sudo apt-get update

echo "🐳 Instalando Docker Engine y herramientas..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "👤 Agregando el usuario actual al grupo docker..."
sudo usermod -aG docker $USER

echo "✅ Instalación completa. Cierra y vuelve a iniciar sesión para aplicar los cambios del grupo docker."


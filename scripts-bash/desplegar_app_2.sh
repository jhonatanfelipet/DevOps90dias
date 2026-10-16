#!/bin/bash

echo "🚀 Iniciando despliegue de microservicios Node.js..."

REPO_URL="https://github.com/roxsross/devops-static-web.git"
BRANCH="ecommerce-ms"
FOLDER="devops-static-web"
LOG_FILE="logs_pm2.txt"
SERVICIOS=("frontend" "merchandise" "products" "shopping-cart")

# Verifica Node.js
if ! command -v node >/dev/null; then
  echo "📦 Instalando Node.js y npm..."
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt-get install -y nodejs
else
  echo "✅ Node.js ya está instalado (versión: $(node -v))"
fi

# Verifica PM2
if ! command -v pm2 >/dev/null; then
  echo "📦 Instalando PM2..."
  sudo npm install -g pm2
else
  echo "✅ PM2 ya está instalado (versión: $(pm2 -v))"
fi

# Clona el repo
if [ -d "$FOLDER" ]; then
  echo "🧹 Eliminando carpeta existente $FOLDER..."
  rm -rf "$FOLDER"
fi

echo "📥 Clonando repositorio desde $REPO_URL (rama $BRANCH)..."
git clone --branch "$BRANCH" "$REPO_URL"

cd "$FOLDER" || { echo "❌ Error: no se pudo acceder al directorio $FOLDER"; exit 1; }

# Instala dependencias en cada carpeta
for servicio in "${SERVICIOS[@]}"; do
  if [ -d "$servicio" ]; then
    cd "$servicio"
    echo "📦 Instalando dependencias en $servicio..."
    npm install
    cd ..
  else
    echo "⚠️ Carpeta $servicio no encontrada. Se omite."
  fi
done

# Ejecuta solo frontend
FRONT_DIR="frontend"
MAIN_SCRIPT="$FRONT_DIR/server.js"
if [ -f "$MAIN_SCRIPT" ]; then
  echo "🚀 Iniciando frontend con PM2 usando index.js..."
  pm2 start "$MAIN_SCRIPT" --name frontend
else
  echo "❌ Error: $MAIN_SCRIPT no encontrado."
fi

pm2 save
pm2 startup | tee -a "$LOG_FILE"
pm2 ls >> "$LOG_FILE"

echo "✅ Despliegue completado con éxito. Log guardado en $LOG_FILE."
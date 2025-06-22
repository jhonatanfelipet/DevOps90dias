#!/bin/bash

# Pedir al usuario el nombre del servicio
read -p "🔧 Ingresá el nombre del servicio a verificar: " SERVICIO

# Verificar si el servicio existe
if ! systemctl list-units --type=service --all | grep -qw "$SERVICIO.service"; then
    echo "⚠️ El servicio '$SERVICIO' no existe o no está instalado."
    exit 1
fi

# Obtener estado del servicio
ESTADO=$(systemctl is-active "$SERVICIO")

# Mostrar estado en forma clara
if [ "$ESTADO" = "active" ]; then
    echo "✅ El servicio '$SERVICIO' está ejecutandose."
else
    echo "❌ El servicio '$SERVICIO' NO se está ejecutando. Estado: $ESTADO"
fi


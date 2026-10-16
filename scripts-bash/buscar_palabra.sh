#!/bin/bash

# Pedir al usuario el nombre del archivo
read -p "📄 Ingresá el nombre del archivo: " ARCHIVO

# Verificar que el archivo existe
if [ ! -f "$ARCHIVO" ]; then
    echo "❌ El archivo '$ARCHIVO' no existe."
    exit 1
fi

# Pedir al usuario la palabra a buscar
read -p "🔍 Ingresá la palabra a buscar: " PALABRA

# Buscar la palabra con grep
if grep -q "$PALABRA" "$ARCHIVO"; then
    echo "✅ ¡Encontrado!"
else
    echo "🔎 No encontrado."
fi


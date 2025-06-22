#!/bin/bash

# Definir el nombre de usuario (cambiá esto por tu nombre de usuario real)
USUARIO="vagrant"

# Ruta donde se guardarán los backups
DESTINO="/home/$USUARIO/backups"

# Crear el directorio de backups si no existe
mkdir -p "$DESTINO"

# Obtener la fecha actual en formato YYYY-MM-DD_HH-MM-SS
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Nombre del archivo comprimido
ARCHIVO="backup_logs_$TIMESTAMP.tar.gz"

# Comprimir el contenido de /var/log y guardarlo en el directorio de destino
tar -czf "$DESTINO/$ARCHIVO" /var/log

# Mostrar mensaje de éxito
echo "Backup creado: $DESTINO/$ARCHIVO"

# Eliminar archivos de backup que tengan más de 7 días
find "$DESTINO" -name "backup_logs_*.tar.gz" -type f -mtime +7 -exec rm {} \;

# Mostrar mensaje final
echo "Se eliminaron backups de más de 7 días (si los había)"
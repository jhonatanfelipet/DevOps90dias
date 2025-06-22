#!/bin/bash
echo "Ingresa un valor que quieras ver la tabla"
read NUMERO
echo "Mostraremos la tabla del $NUMERO 😁"

for i in {1..10}; do
	resultado=$((NUMERO * i))
	echo "$NUMERO x $i = $resultado"
done
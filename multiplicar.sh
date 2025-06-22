#!/bin/bash
echo "Vamos a probar un scrip que multiplque dos números 🥳"
echo " Ingresa el primer número a multiplicar"
read NUMERO_1
echo "Ingresa seundo número a multiplicar "
read NUMERO_2
RESULTADO=$(($NUMERO_1 * $NUMERO_2))
echo "Tu resultado de multiplicar $NUMERO_1 x $NUMERO_2 es $RESULTADO!⚔️"
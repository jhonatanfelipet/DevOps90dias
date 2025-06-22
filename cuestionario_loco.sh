#!/bin/bash

# Pedir datos al usuario
read -p "👋 ¿Cómo te llamás? " NOMBRE
read -p "🎂 ¿Cuántos años tenés? " EDAD
read -p "🎨 ¿Cuál es tu color favorito? " COLOR

echo ""
echo "🤔 Procesando tus datos locos..."

# Pausa divertida
sleep 1

echo "Se siguen procesando los datos... calmaaa 🐢 🐢 🕣"
sleep 3  

echo " Ya casito, aguanta 😜 😜"
sleep 1 

# Mensaje personalizado
echo ""
echo "Hola $NOMBRE! 😄"
echo "Tienes $EDAD años... ¡una edad excelente para conquistar el mundo! 🌍"
echo "Y tu color favorito es $COLOR... ¡qué elección tan poderosa! 💥"

# Respuestas especiales según edad
if [ "$EDAD" -lt 18 ]; then
    echo "🎈 Eres joven, disfruta full mientras aprendes cosas nuevas."
elif [ "$EDAD" -le 30 ]; then
    echo "🚀 Estás en la mejor etapa para crear, viajar y romperla."
else
    echo "🧠 Con la experiencia que tienes, no hay nada que te detenga."
fi

# Reacción loca según color
if [[ "$COLOR" == "rojo" || "$COLOR" == "Rojo" ]]; then
    echo "🔥 ¡Rojo! Pasión pura... no te detiene nadie."
elif [[ "$COLOR" == "azul" || "$COLOR" == "Azul" ]]; then
    echo "🌊 Azul... tranquilidad y sabiduría, eres un sabio moderno."
elif [[ "$COLOR" == "verde" || "$COLOR" == "Verde" ]]; then
    echo "🌿 Verde... naturaleza, energía y frescura. ¡Eres puro flow!"
elif [[ "$COLOR" == "negro" || "$COLOR" == "Negro" ]]; then
	echo "🏴  Negro... qué coincidencia es el color favorito del amor de mi vida😍"
else
    echo "🌈 ¡$COLOR es un color muy original! Tenés estilo único. 😎"
fi
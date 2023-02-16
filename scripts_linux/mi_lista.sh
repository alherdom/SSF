#!/bin/bash
############################################################################
#
# NOMBRE: media.sh
# OBJETIVO:
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=1, 1:ruta
# SALIDAS: 
#
# FECHA:24/01/2023 
# VERSIOBES: 1.0 (codigo inicial)
#
############################################################################

lista=("rojo" "verde" "azul" "amarilloo")

echo "Mi primer elemento es: ${lista[0]}"
echo "Mi cuarto elemento es: ${lista[3]}"
echo "Mi ultimo elemento es: ${lista[-1]}"
echo "Los elementos segundo, tercero, y cuarto son: ${lista[@]:1:3}"
echo "El numero de elementos de mi lista es: ${#lista[@]}"


for item in "${lista[*]}"

do
	echo "Tengo que comprar: $item"
done


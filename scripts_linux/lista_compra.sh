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

compra=("piña" "queso amarillo" "leche" "queso blanco" "pistacho")

echo "Mi primer elemento es: ${compra[0]}"
echo "Mi cuarto elemento es: ${compra[3]}"
echo "Mi ultimo elemento es: ${compra[-1]}"
echo "Los elementos segundo, tercero, y cuarto son: ${compra[@]:1:3}"
echo "El numero de elementos de mi lista es: ${#compra[@]}"


for item in "${compra[*]}"

do
	echo "Tengo que comprar: $item"
done


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

compra=["piña" "queso amarillo" "piña" "leche" "queso blanco" "pistacho"]

echo "Mi lista de la compra es:"




for item in $compra
do
	echo "Tengo que comprar: $item"
done

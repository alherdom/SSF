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

valores="$@"
cantidad=$#

echo "Todos los argumentos son: $@"
echo "Los tres primeros argumentos son: ${@:1:3}"


for valor in $valores
do
	((media += valor))
done

((media /= cantidad))

echo "La media es $media"

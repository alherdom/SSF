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
function calcula_media {

local valores="$@"
local num_arg=$#

if [ "$num_arg" -eq 0 ]
then 
	echo "ERROR: No se han indicado argumentos"
	return 140
fi

for valor in $valores
do
	((media += valor))
done

((media /= num_arg))

echo "$media"
}

calcula_media 

a=( 345 234 234234 234234 2234)
calcula_media ${a[@]} 
b=(123412 423 234 234234)
calcula_media ${b[@]} 

calcula_media 1 1 1 1

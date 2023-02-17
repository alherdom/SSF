#!/bin/bash
############################################################################
#
# NOMBRE: ej01-resta.sh
# OBJETIVO: Restar dos números.
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=2, 1: minuendo, 2: sustraendo
# SALIDAS: Obtenemos la resta de los argumentos
#
# FECHA:17/02/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
if [ $# -eq 0 ] 
then
	echo "Error: Faltan los argumentos para la operación"
	read -p "Introduzca el minuendo: " minuendo
	read -p "Introduzca el sustraendo: " sustraendo
else
	minuendo=$1
	sustraendo=$2
fi
resultado=$(bc<<<$minuendo-$sustraendo)
echo "El resultado de la operación es: "$minuendo" - "$sustraendo" = "$resultado" "

#!/bin/bash
##############################################################################
#
# NOMBRE: ej07-compara.sh
# OBJETIVO: Comparar dos numeros
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=2
# SALIDAS: Indica que numero es mayor o si estos son iguales
#
# FECHA: 17/02/2023 
# VERSIONES: 1.0 (codigo inicial)
#
##############################################################################
if [ $# -ne 2 ] 
then
	echo "Error: Faltan los argumentos para la comparación"
	read -p "Introduzca el primer número: " numero1
	read -p "Introduzca el segundo número: " numero2
else
	numero1=$1
	numero2=$2
fi
if [ $numero1 -gt $numero2 ]
then
	echo "$numero1 es mayor que $numero2"
elif [ $numero1 -lt $numero2 ]
then
	echo "$numero2 es mayor que $numero1"
else
	echo "Son el mismo número: $numero1"
fi
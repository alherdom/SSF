#!/bin/bash
##############################################################################
#
# NOMBRE: ej05-calcula_segundos.sh
# OBJETIVO: Calcular todos los segundos de DIAS HORAS MINUTOS determinados
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=4, 1=dias, 2=horas, 3=minutos, 4=segundos
# SALIDAS: Devolverá el total de segundos del tiempo indicado 
#
#
# VERSIONES: 1.0 (codigo inicial)
# FECHA: 15/02/2023
##############################################################################
if [ $# -ne 4 ]
then
    echo "Error: cantidad incorrecta de parámetros"
    read -p "Indicar días, horas, minutos, segundos: " dias horas minutos segundos
else
	dias=$1
	horas=$2
	minutos=$3
	segundos=$4
fi
	dtos=$(($dias * 86400))
	htos=$(($horas * 3600))
	mtos=$(($minutos * 60))
	total=$(($dtos +  $htos + $mtos + $segundos))
	echo "Los $dias $horas $minutos más $segundos hacen un total de $total segundos"


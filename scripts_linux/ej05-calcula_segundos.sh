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

dias=$1
horas=$2
minutos=$3
segundos=$4
if [ $# -lt 4 ]
    then
        echo "Error: No se han introducido los argumentos mínimos para realizar la conversión, introduzca DIAS HORAS MIN SEG"
else
	dtos=$(($dias * 86400))
	htos=$(($horas * 3600))
	mtos=$(($minutos * 60))
	total=$(($dtos +  $htos + $mtos + $segundos))
	echo "Los $dias $horas $minutos más $segundos hacen un total de $total segundos"
fi

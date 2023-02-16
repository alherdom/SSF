#!/bin/bash
##############################################################################
#
# NOMBRE: ej06-calcula_tiempos.sh
# OBJETIVO: Calcular todos los DIAS HORAS MINUTOS y SEGUNDOS de determinados segundos
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=1
# SALIDAS: Devolverá el total de tiempo indicado en Dias Horas Mins Segs
#
#
# VERSIONES: 1.0 (codigo inicial)
# FECHA: 15/02/2023
##############################################################################

seg=$1
if [ $# -lt 1 ]
    then
        echo "Error: No se han introducido los segundos para realizar la conversión."
else
	dias=$(($seg / 86400))
	rest_dias=$(($seg - $dias * 86400))
	horas=$(($rest_dias / 3600))
	rest_horas=$(bc <<< "$rest_dias % 3600")
	minutos=$(($rest_horas / 60))
	segundos=$(bc <<< "$rest_horas % 60") 
	echo "Los $seg segundos hacen un total de $dias dias, $horas horas, $minutos minutos, y $segundos segundos."
fi

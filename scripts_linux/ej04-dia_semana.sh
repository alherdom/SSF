#!/bin/bash
##############################################################################
#
# NOMBRE: ej04-dia_semana.sh
# OBJETIVO: Mostrar el día de semana de una fecha determinada
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=3, 1=dia, 2=mes, 3=año
# SALIDAS: Devuelve el dia de la semana en función de la fecha
#
#
# VERSIONES: 1.0 (codigo inicial)
# FECHA: 10/02/2023
##############################################################################

anio=$3
mes=$2
dia=$1
if [ $# -lt 3 ]
    then
        echo "Error: No se ha introducido los argumentos necesarios, introduzca día DD mes MM y año AA"
else
dia_sem=$(date -d $anio-$mes-$dia +"%A")
echo "El dia de la semana de la fecha indicada ($anio/$mes/$dia) fue $dia_sem"
fi

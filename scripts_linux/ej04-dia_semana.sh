#!/bin/bash
##############################################################################
#
# NOMBRE: ej04-dia_semana.sh
# OBJETIVO: Mostrar el día de semana de una fecha determinada
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=3, 1=dia, 2=mes, 3=año
# SALIDAS: Devuelve el dia de la semana en función de la fecha
#
# FECHA: 17/02/2023
# VERSIONES: 1.0 (codigo inicial)
#
##############################################################################
if [ $# -ne 3 ]
then
    echo "Error: cantidad de parámetros incorrecta"
    echo "Indicar día, mes, año"
else
    dia=$1
    mes=$2
    anyo=$3
    nombre=$(date -d $anyo-$mes-$dia +"%A")
    echo "El $dia/$mes/$anyo fue $nombre"
fi
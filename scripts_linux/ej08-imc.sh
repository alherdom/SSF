#!/bin/bash
##############################################################################
#
# NOMBRE: ej08-imc.sh
# OBJETIVO: Calcular el IMC
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=2
# SALIDAS: IMC y clasificación segun OMS
#
# FECHA:15/02/2023 
# VERSIONES: 1.0 (codigo inicial)
#
##############################################################################
peso=$1
altura=$2

#imc=$(bc <<< "scale=2; ( $peso * 10000 ) / ( $altura * $altura )")
imc=$(( ($peso * 10000)  /  ($altura * $altura)))

echo "Su indice de masa corporal es: $imc"

if [ $imc -lt 16  ]
   then
	echo "Delgadez severa."
elif [ $imc -ge 16 ] && [ $imc -lt 17 ]
   then
	echo "Delgadez moderada."
elif [ $imc -ge 17 ] && [ $imc -lt 19 ]
    then
         echo "Delgadez leve."
elif [ $imc -ge 19 ] && [ $imc -lt 25 ]
    then
         echo "Normal."
elif [ $imc -ge 25 ] && [ $imc -lt 30 ]
    then
         echo "Preobesidad."
elif [ $imc -ge 30 ]
    then
         echo "Obesidad."
fi





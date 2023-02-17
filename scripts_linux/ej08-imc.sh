#!/bin/bash
##############################################################################
#
# NOMBRE: ej08-imc.sh
# OBJETIVO: Calcular el IMC
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=2
# SALIDAS: IMC y clasificación segun OMS
#
# FECHA:15/02/2023 
# VERSIONES: 1.0 (codigo inicial)
#
##############################################################################
if [ $# -ne 2 ]
then
    echo "Error: parámetros incorrectos"
    echo "Indicar altura en cm y peso en kg"
    exit
fi
peso=$1
altura=$2
imc100=$(bc <<< "scale=0; ( $peso * 1000000 ) / ( $altura * $altura )")
imc=$(bc <<< "scale=2; ( $peso * 10000 ) / ( $altura * $altura )")       
echo "Su indice de masa corporal es: $imc"
if [ $imc100 -lt 1600  ]
     then
          echo "Delgadez severa."
elif [ $imc100 -ge 1600 ] && [ $imc100 -le 1699 ]
     then
          echo "Delgadez moderada."
elif [ $imc100 -ge 1700 ] && [ $imc100 -le 1849 ]
     then
          echo "Delgadez leve."
elif [ $imc100 -ge 1850 ] && [ $imc100 -le 2499 ]
     then
          echo "Normal."
elif [ $imc100 -ge 2500 ] && [ $imc100 -le 2999 ]
     then
          echo "Preobesidad."
elif [ $imc100 -ge 3000 ]
     then
          echo "Obesidad."
fi


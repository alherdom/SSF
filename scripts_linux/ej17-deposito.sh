#!/bin/bash
############################################################################
#
# NOMBRE: ej17-deposito.sh
# OBJETIVO: Uso de bucles para calcular un deposito
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=3 euros, tae, años
# SALIDAS: Devolverá la evolución del deposito por año
#
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################

euros=$1
euros_ini=$1
tae=$2
anyos=$3

if [ $# -ne 3 ]
   then
   echo "No se han introducido los argumentos necesarios"
   exit 100
   
fi
    interes=$(bc <<< "scale=2; $tae / 100")
    result=$(bc <<< "scale=2; $euros * (1 + $interes)")
    dif=$(bc <<< "scale=2; $result - $euros")

    for ((i=1;i<=$anyos;i++))
    do
      echo "Año $i, deposito $result euros, has ganado en total $dif euros."
      euros=$(bc <<< "scale=2; ($result - $euros) + $euros")
      result=$(bc <<< "scale=2; $euros * (1 + $interes)") 
      dif=$(bc <<< "scale=2; $result - $euros_ini")
    done


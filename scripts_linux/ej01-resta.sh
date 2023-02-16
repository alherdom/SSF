#!/bin/bash
############################################################################
#
# NOMBRE: ej01-resta.sh
# OBJETIVO: Restar dos números.
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=2, num1=12, num2=8
# SALIDAS: Obtenemos la resta de los argumentos
#
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################

num1=$1
num2=$2
# control de argumentos
if [ $# -lt 1 ]
    then
        echo "Error: No se ha introducido ningun argumento"
else
resta=$(echo "$1 - $2" | bc)
echo "El resultado de la operación $1 - $2 = $resta"
fi

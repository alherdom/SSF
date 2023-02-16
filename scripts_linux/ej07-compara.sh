#!/bin/bash
##############################################################################
#
# NOMBRE: ej07-compara.sh
# OBJETIVO: Comparar dos numeros
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=2
# SALIDAS: Indica que numero es mayor o si estos son iguales
#
# FECHA:15/02/2023 
# VERSIONES: 1.0 (codigo inicial)
#
##############################################################################

num1=$1
num2=$2
if [ $# -lt 2 ]
    then
	echo "Error: No se ha introducido ningun argumento"
        read -p "Introduce el primer numero a comparar: " num1
	read -p "Introduce el segundo numero a comparar: " num2
	if [ "$num1" -gt "$num2" ] && [ "$num1" -ne "0" ] 
            then
                echo "$num1 es mayor que $num2"
        elif [ "$num1" -lt "$num2" ] 
            then
                echo "$num2 es mayor que $num1"
        else
                echo "$num1 es igual que $num2"
         fi
else
	if [ "$num1" -gt "$num2" ] && [ "$num1" -ne "0" ] 
	    then
		echo "$num1 es mayor que $num2"
	elif [ "$num1" -lt "$num2" ] 
	    then
        	echo "$num2 es mayor que $num1"
	else
        	echo "$num1 es igual que $num2"
	fi
fi

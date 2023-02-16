#!/bin/bash
############################################################################
#
# NOMBRE: ej14-pares.sh
# OBJETIVO: Usar bucle para recorrer un intervalo y realizar calcs y comprobaciones
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Devolverá todos los pares dentro del intervalo y su cuadrado
#
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
num1=$1
num2=$2

if [ $# -lt 2 ]
         then
         echo "Error: No se ha introducido los argumentos, introduzca num1 y num2"
         read -p "Introduce num1: " num1
         read -p "Introduce num2: " num2
fi
# Bucle until descendente:
if [ $num1 -gt $num2 ]
then
    i=$(($num1 - 1))
    until [ $i -lt $num2 ]
    do
	if [[ $(($i % 2)) == 0 ]]
        then
            cuadrado=$(($i**2))
            echo "El cuadrado del numero par $i es $cuadrado"
        fi
	let i-=1
    done
fi
# Bucle for ascendente usando código estilo C:
for ((i=$num1;i<=$num2;i++))
do
	if [[ $(($i % 2)) == 0 ]]
	then
	    cuadrado=$(($i**2))
	    echo "El cuadrado del numero par $i es $cuadrado"
	fi
done

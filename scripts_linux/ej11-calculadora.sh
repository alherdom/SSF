#!/bin/bash
############################################################################
#
# NOMBRE: ej11-calculadora.sh
# OBJETIVO: Uso de un menu para realizar operaciones
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=2, 1-primer operando, 2-segundo operando
# SALIDAS: Resultado de la operación escogida desde un menú
#
# FECHA: 17/02/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
if [ $# -eq 0 ]
then
read -p "Introduzca el primer operando: " operando1
read -p "Introduzca el segundo operando: " operando2
elif [ $# -eq 1 ]
then
operando1=$1
read -p "Introduzca el segundo operando: " operando2
else
operando1=$1
operando2=$2
fi

echo ""
echo "+++++++++++++++++++"
echo "+                 +"
echo "+   Calculadora   +"
echo "+                 +"
echo "+++++++++++++++++++" 
echo ""

echo "1: suma"
echo "2: resta"
echo "3: multiplicación"
echo "4: división"
echo "5: exponenciación"
echo "6: resto_división"

read -p "Indica la opción: " opcion

case $opcion in 
	1|suma) echo $((operando1 + operando2))
	;; 
	2|resta) echo $((operando1 - operando2))
	;;
	3|multiplicación) echo $((operando1 * operando2))
	;;
	4|división) if [ $operando2 -eq 0 ]
                then
                echo "División por 0, error"
                else
                echo $((operando1 / operando2))
                fi
	;; 
	5|exponenciación) echo $((operando1 ** operando2))
	;;
	6|resto_división) if [ $operando2 -eq 0 ]
                      then
                      echo "División por 0, error"
                      else
                      echo $((operando1 % operando2))
                      fi
	;;
	*) echo "$opcion no es un valor válido"
	;;
esac
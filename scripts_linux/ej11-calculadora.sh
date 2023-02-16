#!/bin/bash
############################################################################
#
# NOMBRE: ej11-calculadora.sh
# OBJETIVO: Uso de un menu para realizar operaciones
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=2, num1 y num2
# SALIDAS: El calculo selecionado
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
PS3="Selecciona alguna de la opciones:"

opciones=("Suma" "Resta" "División" "Multiplicación" "Módulo" "Potencia" "Salir")

select opcion in "${opciones[@]}"
do
 case $opcion in
	Suma) echo "El resultado  $num1 + $num2 es $((num1 + num2))"
	;;        
	Resta) echo "El resultado  $num1 - $num2 es $((num1 - num2))"
        ;;
	División) echo "El resultado  $num1 / $num2 es $((num1 / num2))"
        ;;
	Multiplicación)  echo "El resultado  $num1 * $num2 es $((num1 * num2))"
	;;
	Módulo) echo "El resultado $num1 % $num2 es $((num1 % num2))"
	;;
	Potencia) echo "El resultado $num1 ** $num2 es $((num1 ** num2))"
	;;
	Salir) break
	;;
	*) echo "Error, selecione una opcion correcta"
esac
done


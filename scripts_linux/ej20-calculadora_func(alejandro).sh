#!/bin/bash
############################################################################
#
# NOMBRE: ej20-calculadora_func.sh
# OBJETIVO: Uso de un menu y funciones para realizar operaciones
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

function suma {
echo -n $num1 mas $num2 =  ; echo "$num1 + $num2" | bc
}
function resta { 
echo -n $num1 menos $num2 =  ; echo "$num1 - $num2" | bc
}
function divi { 
echo -n $num1 entre $num2 =  ; echo "$num1 / $num2" | bc
}
function multi { 
echo -n $num1 por $num2 =  ; echo "$num1 * $num2" | bc
}
function mod { 
echo -n $num1 modulo $num2 =  ; echo "$num1 % $num2" | bc
}
function pot { 
echo -n $num1 elevado $num2 =  ; echo "$((num1 ** num2))" | bc
}

PS3="Selecciona alguna de la opciones:"
opciones=("Suma" "Resta" "División" "Multiplicación" "Módulo" "Potencia" "Salir")

select opcion in "${opciones[@]}"
do
 case $opcion in
	Suma) suma $num1 $num2
	;;
	Resta) resta $num1 $num2
	;;
	División) divi $num1 $num2
        ;;
	Multiplicación) multi $num1 $num2
	;;
	Módulo) mod $num1 $num2
	;;
	Potencia) pot $num1 $num2
	;;
	Salir) break
	;;
	*) echo "Error, selecione una opcion correcta"
esac
done

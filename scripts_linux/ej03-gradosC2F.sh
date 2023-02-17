#!/bin/bash
##############################################################################
#
# NOMBRE: ej03-gradosC2F.sh
# OBJETIVO: Convertir grados celcius a fahrenheit
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=1
# SALIDAS: Se convierte grados Celsius a grados Fahrenheit
#
# FECHA: 13/01/2023
# VERSIONES: 1.0 (codigo inicial)
#
##############################################################################
if [ $# -ne 1 ]
    then
        echo "Error: No se ha introducido ningun argumento"
		read -p "Introduce el valor de los grados Celsius: " celsius
else
	celsius=$1
fi
fahrenheit=$(echo "$celsius *1.8 + 32" | bc)
echo "Los grados Celsius$celcius convertidos a grados Fahrenheit son $fahrenheit"


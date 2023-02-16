#!/bin/bash
############################################################################
#
# NOMBRE: ej12-multiplo.sh
# OBJETIVO: Bucle para recorrer argumentos y comprobar si es multiplo de un numero
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Se verfica cada argumento si es multiplo
#
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################


read -p "Teclee el multiplo sobre el que comprobar los argumentos: " multiplo

for i in "$@"
do
	if [[ $(($i % $multiplo)) == 0 ]]	
	then
	    echo "$i SÍ es multiplo de $multiplo"
	else
	    echo "$i NO es multiplo de $multiplo"
	fi
done


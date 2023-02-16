#!/bin/bash
##############################################################################
#
# NOMBRE: ej09-info_ruta.sh
# OBJETIVO:mostrar información de una ruta dada
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=1, 1:ruta
# SALIDAS: información sobe la ruta (si existe, tipo, permisos, etc.)
#
# FECHA:19/01/2023 
# VERSIOBES: 1.0 (codigo inicial)
#
##############################################################################

ruta=$1

if [ -z "$ruta" ]
then
	echo "ERROR: el script $0 debe ejecutarse con un argumento (ruta)"
	exit

fi 

if [ ! -e "$ruta" ]
then 
	echo "La ruta '$ruta' NO existe"
	exit
fi

if [ -d "$ruta" ]
then
	echo "La ruta '$ruta' es un directorio"
elif [ -f "$ruta" ]
then
	echo "La ruta '$ruta' es un directorio"
elif [ -h "$ruta" ]
then
	echo "La ruta '$ruta' es un enlace símbolico"
else
	echo "La ruta '$ruta' es de otro tipo"
fi




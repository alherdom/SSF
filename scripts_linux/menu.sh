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
clear
echo ""
echo "***********************"
echo "*********MENU**********"
echo "***********************"
echo ""
echo "1: Ir al Home"
echo "2: Crea un directorio"
echo "3: Que me diga usuario"
echo "4: Imprime la fecha"
echo "5: Mostrar los permisos"
echo "6: "
echo ""
read -p "Indica la opción: " opcion

case $opcion in
	1) echo "Antes estaba en $PWD"
	   cd
	   echo "Ahora estoy en $PWD"
	;;
	2) read -p "Dime el nombre del directorio: " dir
	   mkdir $dir
	;;
	3) whoami #echo $USER
	;;
	4) date
	;;
	5) echo "El script '$0' tiene permisos $(stat -c %A $0) "
	;;
	6)echo ""
	;; 
	*) echo "$opcion No es una opcion correcta"
	;;
esac

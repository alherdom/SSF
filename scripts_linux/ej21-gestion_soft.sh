#!/bin/bash
############################################################################
# AUTOR: Alejandro Hernandez <alherdom@outlook.com>
# NOMBRE: ej21-gestion_software.sh
# OBJETIVO:
# 1. Debe recibir un argumento (nombre del paquete), si el usuario no lo indica, se le pedirá luego por teclado hasta que especifique un nombre.
# 2. Empezar sincronizando el listado de software local
# 3. Si el paquete indicado NO ESTÁ INSTALADO en el sistema, se comproborá si existe en los repositorios del sistema:
#    - Si el paquete SÍ EXISTE en los repositorios: se le mostrará la información del paquete y se le dará la opción de instalarlo.
#    - Si el paquete NO EXISTE en los repositorios: se le mostrará el resultado de la búsqueda de paquetes con el nombre indicado.
# 4. Si el paquete indicado SÍ ESTÁ INSTALADO: se le dará la opción de:
#    - Mostrar su versión
#    - Reinstalarlo
#    - Actualizarlo (solo este paquete, si fuera actualizable)
#    - Eliminarlo (guardando la configuración)
#    - Eliminarlo totalmente
# ARGUMENTOS: Total=1, paquete=1
# SALIDAS: Opciones por terminal en función de las condiciones establecidas.
#
# FECHA:27/02/2023
# VERSIONES: 1.0
#
############################################################################
if [ $# -eq 0 ]; then
	echo "No se ha introducido ningun argumento"
	read -p "Indique el nombre del paquete: " paquete
fi

paquete=$1
clear
sudo apt-get update
dpkg -s $paquete
contador=$(echo $?)
echo $contador

if [ $contador -eq 0 ]; then
	echo "El $paquete SI ESTA INSTALADO!"
	PS3="SELECIONE ALGUNA DE LAS OPCIONES: "
	opciones=("VERSION" "REINSTALL" "UPGRADE" "REMOVE" "PURGE" "EXIT")

	select opcion in "${opciones[@]}"; do
		case $opcion in
		VERSION)
			echo "VERSIÓN DEL PAQUETE"
			$paquete --version
			;;
		REINSTALL)
			echo "REINSTALANDO PAQUETE"
			sudo apt-get reinstall $paquete
			;;
		UPGRADE)
			echo "ACTUALIZANDO PAQUETE"
			sudo apt-get install --only-upgrade $paquete
			;;
		REMOVE)
			echo "ELIMINADO PAQUETE"
			sudo apt-get remove $paquete
			;;
		PURGE)
			echo "ELIMINANDO PAQUETE/CONFIGURACION"
			sudo apt-get autoremove $paquete
			;;
		EXIT)
			break
			;;
		*)
			echo "$opcion NO ES UNA OPCION VALIDA!"
			;;
		esac
	done

elif [ $contador -eq 1 ]; then
	echo "El $paquete NO ESTA INSTALADO!"
	contador2=$(apt-cache search $paquete | wc -l)
	if [ $contador2 -eq 1 ]; then
		echo "INFORMACION DEL PAQUETE: $paquete"
		apt-cache show $paquete
		read -p "DESEA INSTALARLO [Y/n]?" respuesta
		if [ "$respuesta" == "Y" ]; then
			sudo apt-get install $paquete
		else
			exit
		fi
	else
		apt-cache search $paquete
	fi
fi

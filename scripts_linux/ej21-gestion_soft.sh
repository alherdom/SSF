#!/bin/bash
############################################################################
# AUTOR: Alejandro Hernandez <alherdom@outlook.com>
# NOMBRE: ej21-gestion_software.sh
# OBJETIVO:
# 1. Recibe un argumento (nombre del paquete), si no se indica, se le pedirá por teclado.
# 2. Empezar sincronizando el listado de software local
# 3. Si el paquete indicado NO ESTÁ INSTALADO se comproborá si existe en los repositorios del sistema:
#    - Si el paquete SÍ EXISTE, se mostrará información del paquete y se da opción a instalarlo.
#    - Si el paquete NO EXISTE, se mostrará resultado de búsqueda de paquetes con ese nombre.
# 4. Si el paquete indicado SÍ ESTÁ INSTALADO: se le dará la opción de:
#    - Mostrar su versión.
#    - Reinstalarlo.
#    - Actualizarlo (solo este paquete, si fuera actualizable).
#    - Eliminarlo (guardando la configuración).
#    - Eliminarlo totalmente.
#
# ARGUMENTOS: Total=1, paquete=1
# SALIDAS: Opciones en la terminal.
#
# FECHA:27/02/2023
# VERSIONES: 1.0
############################################################################
if [ $# -eq 0 ]; then
	echo "No se ha introducido ningun argumento"
	read -p "Indique el nombre del paquete: " paquete
fi

paquete=$1
sudo apt-get update
dpkg -s $paquete
instalado=$?
clear

if [ $instalado -eq 0 ]; then
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
			echo "EXIT"
			break
			;;
		*)
			echo "$opcion NO ES UNA OPCION VALIDA!"
			;;
		esac
	done

elif [ $instalado -eq 1 ]; then
	echo "El $paquete NO ESTA INSTALADO!"
	existe=$(apt-cache search $paquete | wc -l)
	if [ $existe -eq 1 ]; then
		echo "INFORMACION DEL PAQUETE: $paquete"
		apt-cache show $paquete
		read -p "DESEA INSTALARLO? [Y/n] " respuesta
		if [ "$respuesta" == "Y" ]; then
			sudo apt-get install $paquete
		else
			echo "INSTALACION CANCELADA"
			exit
		fi
	else
		apt-cache search $paquete
	fi
fi

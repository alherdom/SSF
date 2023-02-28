#!/bin/bash
############################################################################
# AUTOR: Alejandro Hernandez <alherdom@outlook.com>
# NOMBRE: gestion_software.sh
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
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
if [ $# -eq 0 ]
   then
       echo "Error: No se ha introducido ningun argumento"
       read -p "Indique el nombre del paquete: " paquete
fi
paquete=$1
clear
sudo apt-get update
contador=$(apt list --installed | grep -c $paquete)
echo $contador

if [ $contador -eq 1 ]
   then
       echo "El paquete SI ESTA INSTALADO"
	   PS3="Selecciona alguna de la opciones:"
	   opciones=("Version" "Reinstalar" "Actualizar" "Remover" "Purgar" "Salir")

	select opcion in "${opciones[@]}"
	do
        case $opcion in
		Version) $paquete --version
		;;
		Reinstalar) sudo apt-get reinstall $paquete
		;;
		Actualizar) sudo apt-get install --only-upgrade $paquete
		;;
		Remover) sudo apt-get remove $paquete
		;;
		Purgar) sudo apt-get purge $paquete
		;;
		Salir) break
		;;
		*) echo "$opcion No es un opcion valida"
		;;
       esac
       done
else
    echo "El paquete NO ESTA INSTALADO"
    contador=$(apt search $paquete | wc -l)
    if [ $contador -ge 1 ]
       then
	       echo "INFORMACION DEL PAQUETE: $paquete"
           apt-cache show $paquete
	       read -p "DESEA INSTALARLO [Y/n]?" respuesta
	   if [ "$respuesta" == "Y" ]
	      then
		      sudo apt-get install $paquete
	   	  else
              exit
	   fi
    else
        apt-cache search $paquete
    fi
fi

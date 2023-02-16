#!/bin/bash
##############################################################################
#
# NOMBRE: ej02-crea_usuario.sh
# OBJETIVO: Imprimir por pantalla un mensaje
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=3, 1=nombre, 2=apellido, 3=usuario
# SALIDAS: Se imprime en pantalla el mensaje 
#
#
# VERSIONES: 1.0 (codigo inicial)
#
##############################################################################

nombre=$1
apellidos=$2
usuario=$3
# control de argumentos
if [ $# -lt 1 ]
    then
        echo "Error: No se ha introducido ningun argumento"
else
	echo "Bienvenido, $nombre"
	echo "Tus datos son: $nombre $apellidos "
	echo "Vamos a crear tu usuario: $usuario "
	echo "Tu nueva ID es aleatorio: $RANDOM" 

	echo ""
	echo "Has ejecutado $0  indicando $# argumentos que son $@"
	echo "Estás en la línea $LINENO y llevas ejecuntando $SECONDS segundos"
	echo "Eres el usuario $USER y estás en la máquina $HOSTNAME con una terminal $TERM. Tu Home es $HOME"
	echo "ERROR ($LINENO)"
fi

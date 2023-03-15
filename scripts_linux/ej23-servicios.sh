#!/bin/bash
############################################################################
# AUTOR: Alejandro Hernández Domínguez <alherdom@outlook.com>
# NOMBRE: ej23-servicios.sh
# OBJETIVO:
# 1. Debe recibir un argumento (nombre del servicio), si el usuario no lo indica, se le pedirá luego por teclado hasta que especifique un nombre.
# 2. Lo primero que hará es comprobar si el nombre indicado es realmente un servicio. Si no es así, emitirá un error con código 10 y terminará la ejecución
# 3. Mostrar un resumen del estado del servicio indicando su nombre y si está activo (SÍ o NO), habilitado (SÍ o NO), enmascarado (SÍ o NO)
# 4. Mostrar un menú con las siguientes opciones (van a depender del estado del servicio)
#    1. Activar el servicio (si estaba inactivo y NO enmascarado. Si estaba ya activo, se ofrecerá la opción de Desactivarlo)
#    2. Habilitar el servicio (si estaba deshabilitado. Si estaba habilitado, se ofrecerá la opción de Deshabilitarlo)
#    3. Enmascarar el servicio (si estaba desenmascarado. Si estaba ya enmascarado, se ofrecerá la opción de Enmascararlo)
#    4. Mostrar configuración
#    5. Aplicar cambios en la configuración dejando el servicio activo
#    6. Aplicar cambios en la configuración dejando el servicio en su último estado
#    7. Mostrar el tiempo de carga total del sistema
#    8. Mostrar el tiempo de carga de este servicio
#    9. Apagar la máquina
#    10. Reiniciar la máquina
#    11. Salir.
#
# ARGUMENTOS: Total=1, paquete=1
# SALIDAS: Opciones en la terminal.
# FECHA: 15/03/2023
# VERSIONES: 1.0
############################################################################
if [ $# -eq 0 ]; do
	echo "No se ha introducido ningun argumento"
	read -p "Indique el nombre del servicio: " service_name
else
service_name=$1
fi

service --status-all | grep $service_name
is_service=$?


if [ is_service -eq 1 ]; then
    echo 'Error 10: El $service_name no es un servicio'
    exit 10
else
    echo 'El $service_name si es un servicio'
    echo 'Mostrando su estado:'
    systemctl status $service_name
fi

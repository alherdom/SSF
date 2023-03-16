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
# Input argument control and variable declaration
if [ $# -eq 0 ]; then
	echo "Error, no argument has been entered!"
	read -p "Pleases, enter the name of the service: " service_name
else
service_name=$1
fi
# Check whether it is a service or not
service --status-all | grep $service_name
is_service=$?

if [ $is_service -eq 1 ]; then
    echo "Error 10: The $service_name is NOT a service"
    exit 10
else
    echo "The $service_name IF it is a service"
    echo "Showing summary of service status:"
    is_active=$(systemctl is-active $service_name)
    is_enabled=$(systemctl is-enabled $service_name)
    if [ $is_active == "active" ]; then
        echo "YES, the $service_name is active"
    else
         echo "NO, the $service_name is not active"
    fi
    if [ $is_enabled == "enabled" ]; then
        echo "YES, the $service_name is enabled"
    else
        echo "NO, the $service_name is not enabled"
    fi
    if [ $is_enabled == "masked" ]; then
        echo "YES, the $service_name is masked"
    else
        echo "NO, the $service_name is not masked"
    fi
fi

# Menu with the options
echo "MENU:"
PS3="Select options about the service $service_name or system: "
options=("Active/Inactive" "Enable/Disable" "Mask/Unmask" "Config" "Reload" "Try" "Uptime" "A" "Runlevel0" "Runlevel6" "Exit")

select opcion in "${options[@]}"
do
 case $opcion in
	Active)
    if [ $is_active == "inactive" ] || [ $is_active != "masked" ]; then
        echo "The $service_name is inactive"
        read -p "Do you want to start the service? [Y/n] " reply
		if [ $reply == "Y" ] || [ $reply == "y" ]; then
            systemctl start $service_name
		else
			echo "Activation cancelled"
			exit
        fi
    fi
    if [ $is_active == "active" ]; then
        echo "The $service_name is active"
        read -p "Do you want to stop the service? [Y/n] " reply
		if [ $reply == "Y" ] || [ $reply == "y" ]; then
            systemctl stop $service_name
		else
			echo "Deactivation cancelled"
			exit
        fi
    fi
    ;;  
	Enable)
    echo "Enable"
	;;
	Mask)
    echo "Mask"
    ;;
	Config)
    echo "Config"
	;;
	Reload)
    echo "Reloading the service $service_name: "
    systemctl reload $service_name
	;;
	Try)
    echo "Try"
	;;
	Uptime)
    echo "Showing the system load: "
    uptime
	;;
    Analyze)
    echo "Showing the service load: "
    systemd-analyze blame | grep $service_name.
    ;;
    Runlevel0)
    echo "Runlevel0"
    systemctl isolate runlevel0.target
	;;
    Runlevel6) 
    echo "Runlevel6"
    systemctl isolate runlevel6.target
	;;
    Exit)
    echo Bye!
    exit
	;;
	*)
    echo "Incorrect option, please select one of the valid options"
esac
done
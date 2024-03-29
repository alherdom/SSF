#!/bin/bash
############################################################################
# AUTORES: Alejandro Hernández Domínguez <alherdom@outlook.com>
#          Yamila Ramos Hernández 
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
# ARGUMENTOS: Total=1, service_name=$1
# SALIDAS: Opciones en la terminal.
# FECHA: 15/03/2023
# VERSIONES: 1.0
############################################################################

# Input argument control and variable declaration
service_name=$1
until [ ! -z $service_name ]; do
    echo "Error, no argument has been entered!"
    read -p "Please, enter the name of the service: " service_name
done

# Check whether it is a service or not
systemctl status $service_name >/dev/null 2>/dev/null
is_service=$?

# If is service then show summary, if is not show error and exit
if [ $is_service -eq 4 ]; then
    echo "Error 10: The $service_name is NOT a service"
    exit 10
else
    is_active=$(systemctl is-active $service_name)
    is_enabled=$(systemctl is-enabled $service_name)
    echo "It's ok, the $service_name is a service"
    echo "-----------------------------------"
    echo "| SUMMARY of service status is:   |"
    if [ $is_active == "active" ]; then
        echo "| --> YES, the $service_name is active     |"
    else
        echo "| --> NO, the $service_name is not active  |"
    fi
    if [ $is_enabled == "enabled" ]; then
        echo "| --> YES, the $service_name is enabled    |"
    else
        echo "| --> NO, the $service_name is not enabled |"
    fi
    if [ $is_enabled == "masked" ]; then
        echo "| --> YES, the $service_name is masked     |"
    else
        echo "| --> NO, the $service_name is not masked  |"
    fi
fi

# Menu with the options
echo "-----------------------------------"
echo "--------------| MENU |-------------"
PS3="Select options about the service $service_name or system: "
options=("Start/Stop" "Enable/Disable" "Mask/Unmask" "Configuration" "Reload_Service" "Try_Reload/Restart" "System_Load" "Service_Load" "PowerOff" "Reboot" "Exit")

select opcion in "${options[@]}"; do
    is_active=$(systemctl is-active $service_name)
    is_enabled=$(systemctl is-enabled $service_name)
    case $opcion in
    Start/Stop)
        if [ $is_active == "inactive" ] && [ $is_enabled != "masked" ]; then
            echo "The $service_name is inactive"
            read -p "Do you want to start the service? [Y/n] " reply
            if [ $reply == "Y" ] || [ $reply == "y" ]; then
                sudo systemctl start $service_name
            else
                echo "Start cancelled"
            fi
        elif [ $is_enabled == "masked" ]; then
            echo "The service is masked and inactive!"
        fi
        if [ $is_active == "active" ]; then
            echo "The $service_name is active"
            read -p "Do you want to stop the service? [Y/n] " reply
            if [ $reply == "Y" ] || [ $reply == "y" ]; then
                sudo systemctl stop $service_name
            else
                echo "Stop cancelled"
            fi
        fi
        ;;
    Enable/Disable)
        if [ $is_enabled == "enabled" ]; then
            echo "The $service_name is enabled"
            read -p "Do you want to disable the service? [Y/n] " reply
            if [ $reply == "Y" ] || [ $reply == "y" ]; then
                sudo systemctl disable $service_name
            else
                echo "Disable cancelled"
            fi
        else
            echo "The $service_name is disabled"
            read -p "Do you want to enable the service? [Y/n] " reply
            if [ $reply == "Y" ] || [ $reply == "y" ]; then
                sudo systemctl enable $service_name
            else
                echo "Enable cancelled"
            fi
        fi
        ;;
    Mask/Unmask)
        if [ $is_enabled == "masked" ]; then
            echo "The $service_name is masked"
            read -p "Do you want to unmask the service? [Y/n] " reply
            if [ $reply == "Y" ] || [ $reply == "y" ]; then
                sudo systemctl unmask $service_name
            else
                echo "Unmask cancelled"
            fi
        else
            echo "The $service_name is unmasked"
            read -p "Do you want to mask the service? [Y/n] " reply
            if [ $reply == "Y" ] || [ $reply == "y" ]; then
                sudo systemctl mask $service_name
            else
                echo "Mask cancelled"
            fi
        fi
        ;;
    Configuration)
        echo "Showing the $service_name configuration: "
        systemctl show $service_name
        ;;
    Reload_Service)
        echo "Reloading the service $service_name: "
        sudo systemctl reload $service_name
        ;;
    Try_Reload/Restart)
        echo "Try reloading or restarting the service $service_name"
        sudo systemctl try-reload-or-restart $service_name
        ;;
    System_Load)
        echo "Showing the system load: "
        systemd-analyze time
        ;;
    Service_Load)
        echo "Showing the $service_name load: "
        systemd-analyze blame | grep $service_name.
        ;;
    PowerOff)
        echo "Machine power off!"
        sudo systemctl isolate runlevel0.target
        ;;
    Reboot)
        echo "Machine reboot!"
        sudo systemctl isolate runlevel6.target
        ;;
    Exit)
        echo Bye!
        exit
        ;;
    *)
        echo "Incorrect option, please select one of the valid options"
        ;;
    esac
done

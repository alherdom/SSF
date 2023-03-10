#!/bin/bash
#
############################################
#
# NOMBRE: ej22-procesos.sh
# AUTOR: <Samuel Eloy González Díaz> <Alejandro Hernández Domínguez>
# OBJETIVO: Monitorizar el % de carga de la memoria y de la CPU de la máquina, 
# y mediante opciones por menú, actuar como se desee. 
#
# ARGUMENTOS: Total=2; maxCPU=$1 maxMem=$2
# FECHA: 10/03/2023
############################################

# Control de argumentos
if [ $# -lt 2 ]; then
    echo 'Error 100'
    exit 100
else
    maxCPU=$1
    maxMem=$2
fi

if ! [[ $1 -ge 0 ]] || ! [[ $2 -ge 0 ]]; then
    echo 'Error 200'
    exit 200
fi

if ! [ $2 -le 100 ]; then
    echo 'Error 150'
    exit 150
fi

# Funciones señales de usuario
function user_interruption {
    echo " Interrumpiendo ejecución"
    exit
}
trap user_interruption SIGTSTP

function user_finish {
    echo " Finalizando ejecución..."
    exit
}
trap user_finish SIGINT

function user_action1 {
    echo " La carga del sistema es: "
    uptime
}
trap user_action1 SIGUSR1

function user_action2 {
    echo " Reanudando procesos detenidos..."
    kill -CONT -1
}
trap user_action2 SIGUSR2


# Función para las distintas operaciones de los procesos
function operaciones_procesos {
    select option in "Ignorar el aviso y seguir comprobando" "Disminuir en 3 puntos la prioridad del proceso" "Interrumpir el proceso" "Terminar el proceso" "Finalizar inmediatamente el proceso" "Detener el proceso ('"'congelarlo'"' de forma evitable)" "Detener el proceso ('"'congelarlo'"' de forma INevitable)" "Salir del script"; do
        case $option in
        "Ignorar el aviso y seguir comprobando")
            comprobacion
            break
            ;;
        "Disminuir en 3 puntos la prioridad del proceso")
            renice 3 $pid_mem || renice 3 $pid_CPU
            break
            ;;
        "Interrumpir el proceso")
            kill -2 $pid_mem || kill -2 $pid_CPU
            break
            ;;
        "Terminar el proceso")
            kill $pid_mem || kill $pid_CPU
            break
            ;;
        "Finalizar inmediatamente el proceso")
            kill -9 $pid_mem || kill -9 $pid_CPU
            break
            ;;
        "Detener el proceso ('congelarlo' de forma evitable)")
            kill -20 $pid_mem || kill -20 $pid_CPU
            break
            ;;
        "Detener el proceso ('congelarlo' de forma INevitable)")
            kill -19 $pid_mem || kill -19 $pid_CPU
            break
            ;;
        "Salir del script")
            exit
            ;;
        *)
            echo "ERROR. Por favor, selecciona una opción entre las disponibles."
            ;;
        esac
    done
    exit
}

# Funcion bucle principal
function comprobacion {
    while true; do
        pid_CPU=$(ps -eo pid --sort=-%cpu h | head -n 1)
        pid_mem=$(ps -eo pid --sort=-%mem h | head -n 1)
        maxCPUsystem=$(ps -eo %cpu --sort=-%cpu h | head -n 1)
        maxMemsystem=$(ps -eo %mem --sort=-%mem h | head -n 1)
        overload_CPU=$(echo "$maxCPUsystem <= $maxCPU" | bc)
        overload_Mem=$(echo "$maxMemsystem <= $maxMem" | bc)
        if [ $overload_CPU -eq 1 ] && [ $overload_Mem -eq 1 ]; then
            echo "Los procesos no superan los límites establecidos"
            sleep 30
        elif [ $overload_CPU -ne 1 ]; then
            ps u -p $pid_CPU
            echo "Los procesos superan los límites establecidos"
            echo "El proceso del sistema que más porcentaje de CPU consume está por encima de $maxCPU"
            operaciones_procesos
        elif [ $overload_Mem -ne 1 ]; then
            ps u -p $pid_mem
            echo "Los procesos superan los límites establecidos"
            echo "El proceso del sistema que más porcentaje de memoria consume está por encima de $maxMem"
            operaciones_procesos
        fi
    done
}
comprobacion

#!/bin/bash
############################################################################
# AUTORES: Alejandro Hernández Domínguez <alherdom@outlook.com>
# NOMBRE: ej24-usuarios.sh
#
# ARGUMENTOS: Cualquier número de argumentos.
# SALIDAS:
# FECHA: 23/03/2023
# VERSIONES: 1.0
############################################################################

# Input control arguments
if [ $# -lt 1 ]; then
    echo 'Error 5'
    exit 5
else
arguments=("$@")
declare -a data
echo "Recive $# arguments: ${arguments[@]}"

# Constructor for data array:
for argument in ${arguments[@]}
do
  users+=("$argument")
done
echo "Array of ${#users[@]} users: ${users[@]}"

# Argument control and variable declaration
until [ ! -z $group_name ]; do
    read -p "Please, enter the name of the group: " group_name
done
    echo "Create the $group_name group"
    sudo groupadd $group_name
fi
for user in ${users[@]}
do
    id $user >/dev/null 2>/dev/null
    is_exist=$?
    if [ $is_exist -eq 0 ]; then
        echo "The $user already exists in the system"
        sudo usermod -g $group_name $user
    else
        echo "The $user NOT exists in the system"
        echo "Create the new $user user"
        sudo useradd -g $group_name -m -s /bin/bash $user
        sudo usermod -a -G lp,scanner $user
    fi
done
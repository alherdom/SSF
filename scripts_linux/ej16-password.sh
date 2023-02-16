#!/bin/bash
############################################################################
#
# NOMBRE: ej16-password.sh
# OBJETIVO: Uso de bucle para solicitar contraseña correcta
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Devolverá si la contraseña es correcta o incorrecta hasta acertar
#
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################

read -sp "Teclee su constraseña: " input1
echo $input1
echo -e "\n"
read -sp "Teclee de nuevo su contraseña: " input2

while [[ "$input1" != "$input2" ]]
do
        echo -e "\n"
	echo "Contraseña incorrecta!"
	read -sp "Teclee la contraseña correcta: " input2
done
    echo -e "\n"
    echo "CONTRASEÑA CORRECTA!"

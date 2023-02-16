#!/bin/bash

##############################################################################
#
# NOMBRE: area_rect.sh
# OBJETIVO: Calcular el area de un rectangulo
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: Ninguno
# SALIDAS: Se imprime en pantalla el area del rectagulo
#
# FEHCA: 13/01/2023
# VERSIOBES: 1.0 (codigo inicial)
#
##############################################################################

echo "Introduce el valor de la base:"
read base

read -p "Introduce el valor de la altura: " altura
read -p "Introduce el valor de la unidad: " unidad


# Vamos a hacer los calculos solo con enteros
area=$(( base * altura ))

echo "El rectángulo de base $base $unidad y altura $altura $unidad tiene un área de
 $area $unidad cuadrados."


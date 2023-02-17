#!/bin/bash
############################################################################
#
# NOMBRE: ej14-pares.sh
# OBJETIVO: Bucle para recorrer un intervalo y realizar calcs y comprobaciones
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Devolverá todos los pares dentro del intervalo y su cuadrado
#
# FECHA: 17/02/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################

if [ $# -eq 0 ]
then
read -p "Introduzca la primera cota: " cota1
read -p "Introduzca la segunda cota: " cota2
elif [ $# -eq 1 ]
then
cota1=$1
read -p "Introduzca la segunda cota: " cota2
else
cota1=$1
cota2=$2
fi

if [ $cota1 -gt $cota2 ]
then
step=-1
elif [ $cota1 -lt $cota2 ] 
then
step=1
else
echo "El intervalo está vacío"
exit
fi

echo "Mostrando los cuadrados de los números pares entre $cota1 y $cota2:"
for i in `seq $cota1 $step $cota2`
do
resto=$(( $i % 2 ))
if [ $resto -eq 0 ]
then
echo "  El cuadrado de $i es $(($i ** 2))"
fi
done
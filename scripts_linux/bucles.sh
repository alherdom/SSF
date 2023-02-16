#!/bin/bash
##############################################################################
#
# NOMBRE: bucles.sh
# OBJETIVO:mostrar información de una ruta dada
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: total=1, 1:ruta
# SALIDAS: 
#
# FECHA:20/01/2023 
# VERSIOBES: 1.0 (codigo inicial)
#
##############################################################################

ini=23
step=54
end=2

for i in $(seq $ini $step $end)
do
	echo "D: $i"
done

i=1
while [ "$i" -lt 10 ]
do
	echo "W: $i"
	(( i++ ))
done 

for i in `seq 1 10`
do
	echo "Ini: $i"

	if [ "$i" -le 3 ] ; then
		continue


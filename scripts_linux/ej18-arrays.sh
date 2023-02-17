#!/bin/bash
############################################################################
#
# NOMBRE: ej18-arrays.sh
# OBJETIVO: Generar un array ordenado de numeros enteros
# AUTOR: Javier García <javigh1903@movistar.es> Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: Tantos números enteros como se quiera 
# SALIDAS: Salida de array "datos" con las características marcadas
#          y MIN, MAX y MEDIA de los datos del nuevo array
# 
# VERSIONES: 1.0 (codigo inicial)
# FECHA: 17/02/2023 
############################################################################

echo "Se han recibido $# argumentos: $@"
declare -a datos
for int in $@
do
discriminante=$(( $int % 2 ))
if [ $int -lt 0 ]
then
echo "$int se ignora por ser negativo"
elif [ $discriminante -eq 0 ]
then
datos=("$int" "${datos[@]}")
echo "$int se inserta por el principio porque es par"
else
datos+=( "$int" )
echo "$int se inserta por el final porque es impar"
fi
done

sum=0
max=-1
min=$datos[0]
for int in ${datos[@]}
do
if [ $int -gt $sum ]
then
max=$int
elif [ $int -lt $min ]
then
min=$int
fi
sum=$(( $sum + $int ))
done
media=`echo "scale=2; $sum / ${#datos[@]}" | bc -l`
echo "Array construido (${#datos[@]}): ${datos[@]}"
echo "MIN: $min, MAX: $max, MEDIA: $media"
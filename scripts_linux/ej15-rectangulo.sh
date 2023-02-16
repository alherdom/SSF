#!/bin/bash
############################################################################
#
# NOMBRE: ej15-rectangulo.sh
# OBJETIVO: Uso de bucles para pintar un rectángulo en la terminal
# AUTOR: Alejandro Hdez <alejandrohd1@live.com>
#
# ARGUMENTOS: 
# SALIDAS: Pintado del rectángulo con la altura y base correspondiente
#
# FECHA:24/01/2023 
# VERSIONES: 1.0 (codigo inicial)
#
############################################################################
base=$1
altura=$2

if [ $# -eq 1 ]
    then
    altura=4
    echo "No existe altura, se establce altura = $altura"
    echo "Vamos a pintar un rectángulo de base: $base, altura: $altura, area: $((base * altura))"

elif [ $# -ge 2 ]
    then
    echo "Vamos a pintar un rectángulo de base: $base, altura: $altura, area: $((base * altura))"

elif [ $# -le 0 ]
    then
    base=7
    altura=4
    echo "No existen argumentos, se establece base = $base y altura = $altura"
    echo "Vamos a pintar un rectángulo de base: $base, altura: $altura, area: $((base * altura))"

fi

for ((j=0;j<$altura;j++))
do
  for ((i=1;i<$base;i++))
  do
	echo -n "#"
  done
  echo "#"
done

